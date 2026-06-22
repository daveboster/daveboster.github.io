# Codex Workstation Setup

Use this checklist when setting up a new workstation or starting a new Codex
session for `daveboster/daveboster.github.io`.

## Repository

```bash
git clone git@github.com:daveboster/daveboster.github.io.git
cd daveboster.github.io
git status --short --branch
```

Trust the project in Codex before relying on project-local settings. Start
non-trivial work on a `dev/` branch:

```bash
git switch -c dev/<short-task-name>
```

## GitHub Source of Truth

Use GitHub issues for planned work and handoff notes. A useful Codex task issue
has:

- goal and background
- acceptance criteria
- relevant files or URLs
- verification commands
- open questions or blocked items

Before starting work, inspect the issue and open pull requests:

```bash
gh issue list --repo daveboster/daveboster.github.io --state open
gh pr list --repo daveboster/daveboster.github.io --state open
```

If a Codex session discovers follow-up work, create or update an issue instead
of leaving the only record in chat.

## Local Site Build

The site source is `src/boster.dev`. Use Ruby 3.2, matching
`src/boster.dev/.ruby-version` and the GitHub Actions workflow.

The preferred local workflow is:

```bash
scripts/test-and-preview.sh
```

That command runs the verification checks, then starts a preview server at
`http://127.0.0.1:4000`.

To run the checks without starting the preview server:

```bash
scripts/test-and-preview.sh --check-only
```

The manual build commands are:

```bash
cd src/boster.dev
bundle install
bundle exec jekyll build
```

If `bundle install` reports that a gem requires Ruby 3.x, install or activate
Ruby 3.2 on the workstation before continuing.

To preview locally:

```bash
bundle exec jekyll serve --host 127.0.0.1 --port 4000
```

Then open `http://127.0.0.1:4000`.

## BATS Tests

Use BATS for bash and repository automation checks.

```bash
bats test
```

Tests should load shared helpers through `test/helpers/bats_setup.bash`, which
resolves paths relative to `$BATS_TEST_DIRNAME` so tests work locally and in
GitHub Actions.

## Pull Request Checks

Run these before pushing a PR when relevant:

```bash
cd src/boster.dev
bundle exec jekyll build
cd ../..
bats test
git diff --check
```

Document any command that cannot run, including the command, exit code, and
important error text.
