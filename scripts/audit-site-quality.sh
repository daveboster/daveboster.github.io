#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
repo_root="$(cd "$script_dir/.." && pwd -P)"
site_dir="$repo_root/src/boster.dev"
site_output="$site_dir/_site"
base_url="https://boster.dev"
skip_build=0
check_external=0

usage() {
  cat <<'USAGE'
Usage: scripts/audit-site-quality.sh [options]

Audits the generated Jekyll site for basic link, metadata, and accessibility
contracts.

Default checks:
  bundle exec jekyll build
  internal href/src references resolve inside _site
  HTML pages have lang, viewport, title, canonical, description, and h1
  images have alt text

Options:
  --skip-build       Audit the existing src/boster.dev/_site output.
  --external-links   Also check external HTTP/HTTPS links over the network.
  --base-url URL     Site base URL for canonical/internal checks.
                    Default: https://boster.dev
  -h, --help         Show this help text.
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --skip-build)
      skip_build=1
      shift
      ;;
    --external-links)
      check_external=1
      shift
      ;;
    --base-url)
      base_url="${2:?--base-url requires a value}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 64
      ;;
  esac
done

run() {
  echo "+ $*"
  "$@"
}

if [[ "$skip_build" -eq 0 ]]; then
  cd "$site_dir"
  run bundle exec jekyll build
fi

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 is required for the site quality audit." >&2
  exit 69
fi

python3 - "$site_output" "$base_url" "$check_external" <<'PY'
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import urljoin, urlparse, unquote
import sys
import urllib.error
import urllib.request

site_output = Path(sys.argv[1]).resolve()
base_url = sys.argv[2].rstrip("/") + "/"
check_external = sys.argv[3] == "1"
base_host = urlparse(base_url).netloc


class PageParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.html_lang = False
        self.title = ""
        self.in_title = False
        self.viewport = False
        self.description = False
        self.canonical = False
        self.meta_refresh = False
        self.h1_count = 0
        self.images_missing_alt = []
        self.references = []

    def handle_starttag(self, tag, attrs):
        attrs = {name.lower(): value for name, value in attrs}

        if tag == "html" and attrs.get("lang", "").strip():
            self.html_lang = True
        elif tag == "title":
            self.in_title = True
        elif tag == "meta":
            name = attrs.get("name", "").lower()
            http_equiv = attrs.get("http-equiv", "").lower()
            if name == "viewport" and attrs.get("content", "").strip():
                self.viewport = True
            if name == "description" and attrs.get("content", "").strip():
                self.description = True
            if http_equiv == "refresh":
                self.meta_refresh = True
        elif tag == "link":
            if attrs.get("rel", "").lower() == "canonical" and attrs.get("href", "").strip():
                self.canonical = True
        elif tag == "h1":
            self.h1_count += 1
        elif tag == "img":
            alt = attrs.get("alt")
            if alt is None or not alt.strip():
                self.images_missing_alt.append(attrs.get("src", "<missing src>"))

        for attr in ("href", "src"):
            value = attrs.get(attr)
            if value:
                self.references.append((tag, attr, value.strip()))

    def handle_endtag(self, tag):
        if tag == "title":
            self.in_title = False

    def handle_data(self, data):
        if self.in_title:
            self.title += data


def page_url(path):
    rel = path.relative_to(site_output).as_posix()
    if rel == "index.html":
        return base_url
    if rel.endswith("/index.html"):
        return urljoin(base_url, rel[:-10] + "/")
    return urljoin(base_url, rel)


def internal_target_exists(path):
    parsed = urlparse(path)
    raw_path = unquote(parsed.path)
    if not raw_path or raw_path == "/":
        return (site_output / "index.html").is_file()

    rel_path = raw_path.lstrip("/")
    candidate = site_output / rel_path

    if raw_path.endswith("/"):
        return (candidate / "index.html").is_file()

    if candidate.is_file():
        return True

    if candidate.is_dir() and (candidate / "index.html").is_file():
        return True

    return False


def classify_reference(current_url, value):
    if not value or value.startswith("#"):
        return ("ignored", value)

    parsed = urlparse(value)
    if parsed.scheme in {"mailto", "tel", "javascript", "data"}:
        return ("ignored", value)

    absolute = urljoin(current_url, value)
    parsed_absolute = urlparse(absolute)

    if parsed_absolute.scheme in {"http", "https"} and parsed_absolute.netloc != base_host:
        return ("external", absolute)

    if parsed_absolute.scheme in {"http", "https"}:
        return ("internal", parsed_absolute.path or "/")

    return ("ignored", value)


def check_external_url(url):
    headers = {"User-Agent": "boster.dev site quality audit"}
    for method in ("HEAD", "GET"):
        request = urllib.request.Request(url, headers=headers, method=method)
        try:
            with urllib.request.urlopen(request, timeout=15) as response:
                status = response.getcode()
                if status < 400:
                    return None
                return f"{url} returned HTTP {status}"
        except urllib.error.HTTPError as error:
            if method == "HEAD" and error.code in {403, 405}:
                continue
            if error.code == 403:
                return f"warning: {url} returned HTTP 403; host may block automated checks"
            return f"{url} returned HTTP {error.code}"
        except Exception as error:
            if method == "HEAD":
                continue
            return f"{url} failed: {error}"
    return None


errors = []
warnings = []
html_files = sorted(site_output.rglob("*.html"))
internal_reference_count = 0
external_urls = set()

if not html_files:
    errors.append(f"No HTML files found in {site_output}")

for path in html_files:
    parser = PageParser()
    text = path.read_text(encoding="utf-8")
    parser.feed(text)
    rel = path.relative_to(site_output).as_posix()
    redirect_page = parser.meta_refresh

    if not parser.html_lang:
        errors.append(f"{rel}: missing html lang")
    if not parser.title.strip():
        errors.append(f"{rel}: missing title")
    if not redirect_page and not parser.viewport:
        errors.append(f"{rel}: missing viewport meta")
    if not parser.canonical:
        errors.append(f"{rel}: missing canonical link")
    if not redirect_page and not parser.description:
        errors.append(f"{rel}: missing meta description")
    if not redirect_page and parser.h1_count == 0:
        errors.append(f"{rel}: missing h1")

    for src in parser.images_missing_alt:
        errors.append(f"{rel}: image missing alt text: {src}")

    current_url = page_url(path)
    for tag, attr, value in parser.references:
        kind, target = classify_reference(current_url, value)
        if kind == "internal":
            internal_reference_count += 1
            if not internal_target_exists(target):
                errors.append(f"{rel}: {tag}[{attr}] points to missing internal target: {value}")
        elif kind == "external":
            external_urls.add(target)

if check_external:
    for url in sorted(external_urls):
        error = check_external_url(url)
        if error:
            if error.startswith("warning: "):
                warnings.append(error.removeprefix("warning: "))
            else:
                errors.append(error)

if errors:
    print("Site quality audit failed:", file=sys.stderr)
    for error in errors:
        print(f"- {error}", file=sys.stderr)
    sys.exit(1)

if warnings:
    print("Site quality audit warnings:", file=sys.stderr)
    for warning in warnings:
        print(f"- {warning}", file=sys.stderr)

external_note = f"{len(external_urls)} external links skipped"
if check_external:
    external_note = f"{len(external_urls)} external links checked"

print(
    "Site quality audit passed: "
    f"{len(html_files)} HTML files, "
    f"{internal_reference_count} internal references, "
    f"{external_note}."
)
PY
