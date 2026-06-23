#!/usr/bin/env bats

load "helpers/bats_setup.bash"

@test "site has a Bundler dependency contract" {
  assert_file_exists "src/boster.dev/Gemfile"
  assert_file_contains "src/boster.dev/.ruby-version" "3.2"
  assert_file_contains "src/boster.dev/Gemfile" "gem \"github-pages\""
  assert_file_contains "src/boster.dev/Gemfile" "gem \"jekyll-paginate\""
}

@test "workflow builds with the repository dependency contract" {
  assert_file_contains ".github/workflows/bosterdev-deploy.yml" "scripts/test-and-preview.sh --check-only"
  assert_file_contains ".github/workflows/bosterdev-deploy.yml" "ruby-version: '3.2'"
}

@test "workflow skips Azure preview deployment for Dependabot pull requests" {
  assert_file_contains ".github/workflows/bosterdev-deploy.yml" "github.actor != 'dependabot[bot]'"
}

@test "site publishes crawler discovery endpoints" {
  assert_file_contains "src/boster.dev/_config.yml" "url: \"https://boster.dev\""
  assert_file_contains "src/boster.dev/_config.yml" "repository: daveboster/daveboster.github.io"
  assert_file_exists "src/boster.dev/robots.txt"
  assert_file_exists "src/boster.dev/sitemap.xml"
  assert_file_contains "src/boster.dev/robots.txt" "Sitemap: {{ \"/sitemap.xml\" | absolute_url }}"
  assert_file_contains "src/boster.dev/sitemap.xml" "http://www.sitemaps.org/schemas/sitemap/0.9"
  assert_file_contains "src/boster.dev/sitemap.xml" "item.url contains \"/assets/\""
}

@test "layout does not require GitHub metadata at build time" {
  refute_file_contains "src/boster.dev/_layouts/default.html" "site.github."
}

@test "known site spelling and tag markup issues stay fixed" {
  assert_file_contains "src/boster.dev/tag/github-pages.md" "title: \"Topic: GitHub Pages\""
  assert_file_contains "src/boster.dev/tag/jekyll-posts.md" "tag: jekyll-posts"
  assert_file_exists "src/boster.dev/_posts/2023-05-02-healthcare-technology-lessons-yet-to-be-learned.md"
  assert_file_not_exists "src/boster.dev/_posts/2023-05-02-healthcare-technolgy-lessons-yet-to-be-learned.md"
  assert_file_exists "src/boster.dev/2023/05/02/healthcare-technolgy-lessons-yet-to-be-learned.html"
  assert_file_contains "src/boster.dev/2023/05/02/healthcare-technolgy-lessons-yet-to-be-learned.html" "healthcare-technology-lessons-yet-to-be-learned.html"
  assert_file_contains "src/boster.dev/index.md" "Test-Driven Development (TDD)"
  assert_file_contains "src/boster.dev/_layouts/post.html" "highlighter-rouge"
  refute_file_contains "src/boster.dev/_layouts/post.html" "highligher-rouge"
}

@test "dependabot monitors GitHub Actions and Bundler dependencies" {
  assert_file_contains ".github/dependabot.yml" "package-ecosystem: \"github-actions\""
  assert_file_contains ".github/dependabot.yml" "package-ecosystem: \"bundler\""
  assert_file_contains ".github/dependabot.yml" "directory: \"/src/boster.dev\""
}

@test "content ideas use a backlog document before issue work" {
  assert_file_exists "docs/content/ideas-backlog.md"
  assert_file_exists ".github/ISSUE_TEMPLATE/content-work.md"
  assert_file_not_exists ".github/ISSUE_TEMPLATE/content-idea.md"
  assert_file_contains "AGENTS.md" "Raw content ideas live in `docs/content/ideas-backlog.md`"
  assert_file_contains ".github/ISSUE_TEMPLATE/content-work.md" "docs/content/ideas-backlog.md"
}

@test "generated and local files are ignored" {
  assert_file_contains ".gitignore" "src/boster.dev/_site/"
  assert_file_contains ".gitignore" ".bundle/"
}

@test "test and preview script documents the local verification flow" {
  assert_file_exists "scripts/test-and-preview.sh"
  assert_file_exists "scripts/audit-site-quality.sh"
  assert_file_contains "docs/codex/workstation-setup.md" "scripts/test-and-preview.sh"
  assert_file_contains "docs/codex/workstation-setup.md" "scripts/audit-site-quality.sh --skip-build"
  assert_file_contains "scripts/test-and-preview.sh" "scripts/audit-site-quality.sh --skip-build"

  run "$(fixture_path "scripts/test-and-preview.sh")" --help

  [ "$status" -eq 0 ]
  [[ "$output" == *"bundle exec jekyll build"* ]]
  [[ "$output" == *"scripts/audit-site-quality.sh --skip-build"* ]]
  [[ "$output" == *"bats test"* ]]
  [[ "$output" == *"bundle exec jekyll serve"* ]]
}

@test "site quality audit script documents offline and external checks" {
  run "$(fixture_path "scripts/audit-site-quality.sh")" --help

  [ "$status" -eq 0 ]
  [[ "$output" == *"--skip-build"* ]]
  [[ "$output" == *"--external-links"* ]]
  [[ "$output" == *"internal href/src references resolve"* ]]
}
