#!/usr/bin/env bats

load "helpers/bats_setup.bash"

@test "site has a Bundler dependency contract" {
  assert_file_exists "src/boster.dev/Gemfile"
  assert_file_contains "src/boster.dev/.ruby-version" "3.2"
  assert_file_contains "src/boster.dev/Gemfile" "gem \"github-pages\""
  assert_file_contains "src/boster.dev/Gemfile" "gem \"jekyll-paginate\""
}

@test "workflow builds with the repository dependency contract" {
  assert_file_contains ".github/workflows/bosterdev-deploy.yml" "bundle exec jekyll build"
  assert_file_contains ".github/workflows/bosterdev-deploy.yml" "ruby-version: '3.2'"
}

@test "dependabot monitors GitHub Actions and Bundler dependencies" {
  assert_file_contains ".github/dependabot.yml" "package-ecosystem: \"github-actions\""
  assert_file_contains ".github/dependabot.yml" "package-ecosystem: \"bundler\""
  assert_file_contains ".github/dependabot.yml" "directory: \"/src/boster.dev\""
}

@test "generated and local files are ignored" {
  assert_file_contains ".gitignore" "src/boster.dev/_site/"
  assert_file_contains ".gitignore" ".bundle/"
}
