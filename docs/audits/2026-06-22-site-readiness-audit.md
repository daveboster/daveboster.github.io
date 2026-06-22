# Site Readiness Audit: 2026-06-22

## Summary

This audit covers repository readiness for Codex-assisted work, local build
reproducibility, CI/dependency health, production availability,
SEO/discoverability, content hygiene, GitHub backlog hygiene, and operational
follow-up.

The initial Codex workflow setup is being addressed on
`dev/codex-workflow-audit` and tracked in issue #38. Remaining findings are
tracked as GitHub issues so future Codex sessions can resume work from the
repository and issue backlog instead of chat history.

## Evidence Checked

- Repository branch was clean on `main` before implementation.
- Site source is under `src/boster.dev`.
- Production `https://boster.dev/` returned HTTP 200 on 2026-06-22.
- Production `https://boster.dev/assets/css/style.css` returned HTTP 200.
- Production `https://boster.dev/robots.txt` returned an Azure Static Web Apps
  404 page.
- Production `https://boster.dev/sitemap.xml` returned HTTP 404.
- Open pull request #33 updates `actions/checkout` from v4 to v6, but its failed
  GitHub Actions logs are no longer retrievable through `gh run view`.
- Open issue #30 records a 2024 outage that appears remediated because the
  production site is currently reachable.

## Findings

### Resolved By Current Setup Branch

- The repository did not have a local Jekyll dependency contract. The setup
  branch adds `src/boster.dev/Gemfile`, `src/boster.dev/.ruby-version`, and
  workflow usage of `bundle exec jekyll build`.
- The repository did not have a BATS validation harness. The setup branch adds
  `test/repository_contract.bats` and `test/helpers/bats_setup.bash`.
- The repository did not have Codex-specific shared instructions. The setup
  branch adds `AGENTS.md` and `docs/codex/workstation-setup.md`.
- The repository did not have issue templates for Codex handoff and audit
  findings. The setup branch adds GitHub issue and pull request templates.

### Follow-Up Findings

- Issue #36: PR #33 is stale and unstable. Re-run or recreate the dependency update after
  the reproducible build contract is merged because the original failed logs are
  gone.
- Issue #35: Issue #30 should be closed or converted into a short postmortem
  item. The site is currently reachable, so the issue no longer appears to
  describe an active outage.
- Issue #34: The production site does not expose `robots.txt` or `sitemap.xml`.
  Add these if discoverability matters for the personal site.
- Issue #37: Several small spelling or template cleanup items exist:
  - `highligher-rouge` appears in tag markup and should likely be
    `highlighter-rouge`.
  - `technolgy` appears in a post filename.
  - `Test-Drive Development` appears where `Test-Driven Development` is likely
    intended.

## Recommended Next Work

1. Merge the Codex workflow setup through a pull request after verification.
2. Re-run or recreate PR #33 once the new build contract is available.
3. Resolve the stale outage issue with current production evidence.
4. Add basic `robots.txt` and `sitemap.xml` support.
5. Fix the spelling/template cleanup items in a focused content hygiene change.
