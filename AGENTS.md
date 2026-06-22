# Repository Guidelines

## Project Purpose

This repository backs the personal website at `https://boster.dev`.
GitHub issues and pull requests are the source of truth for planned work,
status, and handoff between Codex sessions on different workstations.

## Site Structure

- The Jekyll site source lives in `src/boster.dev`.
- Generated site output belongs in `src/boster.dev/_site` and must not be
  committed.
- Repo coordination docs live under `docs/`.
- Bash and workflow helper tests live under `test/` and use BATS.

## Working Agreements

- Start non-trivial work on a `dev/` branch.
- Use GitHub issues for task intent, acceptance criteria, and follow-up work.
- Keep secrets, Azure tokens, local credentials, and generated service files out
  of commits.
- Preserve existing content voice unless the issue explicitly requests a rewrite.
- Prefer small, reviewable changes over broad restyling or unrelated cleanup.
- If a production incident or stale dependency PR is discovered, record the
  evidence in an issue before changing behavior.

## Validation

Run these checks before opening or updating a pull request when relevant:

```bash
cd src/boster.dev
bundle exec jekyll build
cd ../..
bats test
git diff --check
```

If a command cannot run locally, document the exact error in the pull request or
issue so the next Codex session can continue from evidence.

## Review Guidelines

- Treat broken build reproducibility, secret exposure, and deployment workflow
  regressions as high priority.
- For content changes, check links, dates, tags, and whether the writing still
  sounds like a personal site.
- For workflow changes, verify the local command and the GitHub Actions command
  stay aligned.
