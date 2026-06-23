#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$BATS_TEST_DIRNAME/.." && pwd -P)"

fixture_path() {
  printf '%s\n' "$repo_root/$1"
}

assert_file_exists() {
  local path
  path="$(fixture_path "$1")"

  if [[ ! -f "$path" ]]; then
    echo "Expected file to exist: $1" >&2
    return 1
  fi
}

assert_file_not_exists() {
  local path
  path="$(fixture_path "$1")"

  if [[ -f "$path" ]]; then
    echo "Expected file not to exist: $1" >&2
    return 1
  fi
}

assert_file_contains() {
  local path="$1"
  local expected="$2"
  local full_path
  full_path="$(fixture_path "$path")"

  if ! grep -Fq "$expected" "$full_path"; then
    echo "Expected $path to contain: $expected" >&2
    return 1
  fi
}

refute_file_contains() {
  local path="$1"
  local unexpected="$2"
  local full_path
  full_path="$(fixture_path "$path")"

  if grep -Fq "$unexpected" "$full_path"; then
    echo "Expected $path not to contain: $unexpected" >&2
    return 1
  fi
}
