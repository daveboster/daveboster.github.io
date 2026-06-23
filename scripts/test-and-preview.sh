#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
repo_root="$(cd "$script_dir/.." && pwd -P)"
site_dir="$repo_root/src/boster.dev"
ruby_version_file="$site_dir/.ruby-version"

host="127.0.0.1"
port="4000"
check_only=0
skip_install=0

usage() {
  cat <<'USAGE'
Usage: scripts/test-and-preview.sh [options]

Runs the local verification flow, then starts the Jekyll preview server.

Verification flow:
  bundle install
  bundle exec jekyll build
  scripts/audit-site-quality.sh --skip-build
  bats test
  git diff --check

Preview:
  bundle exec jekyll serve --host 127.0.0.1 --port 4000

Options:
  --check-only       Run verification without starting the preview server.
  --skip-install     Skip bundle install.
  --host HOST        Preview host. Default: 127.0.0.1.
  --port PORT        Preview port. Default: 4000.
  -h, --help         Show this help text.
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check-only)
      check_only=1
      shift
      ;;
    --skip-install)
      skip_install=1
      shift
      ;;
    --host)
      host="${2:?--host requires a value}"
      shift 2
      ;;
    --port)
      port="${2:?--port requires a value}"
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

active_ruby_version() {
  ruby -e 'print RUBY_VERSION' 2>/dev/null || true
}

activate_homebrew_ruby() {
  local required_version="$1"
  local required_major_minor
  required_major_minor="$(awk -F. '{ print $1 "." $2 }' <<<"$required_version")"
  local active_version
  active_version="$(active_ruby_version)"

  if [[ "$active_version" == "$required_major_minor"* ]]; then
    return 0
  fi

  for prefix in /opt/homebrew /usr/local; do
    local ruby_bin="$prefix/opt/ruby@$required_major_minor/bin"
    local gem_bin="$prefix/lib/ruby/gems/$required_major_minor.0/bin"

    if [[ -x "$ruby_bin/ruby" ]]; then
      export PATH="$ruby_bin:$gem_bin:$PATH"
      active_version="$(active_ruby_version)"

      if [[ "$active_version" == "$required_major_minor"* ]]; then
        return 0
      fi
    fi
  done

  echo "Required Ruby: $required_major_minor.x from $ruby_version_file" >&2
  echo "Active Ruby: $(ruby -v 2>/dev/null || echo 'not found')" >&2
  echo "Install with: brew install ruby@$required_major_minor" >&2
  echo "Then retry this script, or put ruby@$required_major_minor first in PATH." >&2
  exit 69
}

required_ruby="$(tr -d '[:space:]' < "$ruby_version_file")"
activate_homebrew_ruby "$required_ruby"

if ! command -v bundle >/dev/null 2>&1; then
  echo "Bundler is not installed for $(ruby -v)." >&2
  echo "Install it with: gem install bundler" >&2
  exit 69
fi

if ! command -v bats >/dev/null 2>&1; then
  echo "BATS is not installed or not on PATH." >&2
  echo "Install it with: brew install bats-core" >&2
  exit 69
fi

cd "$site_dir"

if [[ "$skip_install" -eq 0 ]]; then
  run bundle install
fi

run bundle exec jekyll build

cd "$repo_root"
run scripts/audit-site-quality.sh --skip-build
run bats test
run git diff --check

if [[ "$check_only" -eq 1 ]]; then
  exit 0
fi

cd "$site_dir"
echo "Preview URL: http://$host:$port"
exec bundle exec jekyll serve --host "$host" --port "$port"
