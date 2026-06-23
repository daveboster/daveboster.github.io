# Site Quality Audit - 2026-06-23

## Scope

This audit covers the repeatable quality checks from the website next-steps
list:

- internal link checking
- optional external link checking
- basic accessibility checks
- basic SEO and metadata checks

## Changes Made

- Added `scripts/audit-site-quality.sh` for rendered-site checks.
- Added the audit script to `scripts/test-and-preview.sh --check-only` so CI
  covers internal links, metadata, and accessibility basics.
- Added missing tag pages for every published post and thought tag.
- Updated tag links to point to the generated `.html` tag pages.
- Updated the tag page layout to list matching thoughts as well as posts.
- Replaced the homepage Dave Farley link because `www.davefarley.net` currently
  has an expired TLS certificate.

## Current Results

Command:

```bash
scripts/test-and-preview.sh --check-only
```

Result:

- Jekyll build passed.
- Site quality audit passed for 39 HTML files.
- 612 internal references resolved.
- 29 external links were skipped in the default offline audit.
- BATS passed.
- `git diff --check` passed.

Command:

```bash
scripts/audit-site-quality.sh --skip-build --external-links
```

Result:

- External link audit passed for 29 external links.
- `https://brenebrown.com` returned HTTP 403 to the automated checker. This is
  recorded as a warning because the host appears to block scripted checks rather
  than indicating a missing page.

## Follow-Up

- Consider adding a fuller accessibility tool such as axe or Pa11y later if the
  site grows beyond static content and simple layouts.
- Recheck external links periodically because they are intentionally not part of
  the default CI path.
