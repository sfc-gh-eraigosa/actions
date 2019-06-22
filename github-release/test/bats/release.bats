#!/usr/bin/env bats

load ${BASE_TEST_DIR}/helpers.bash

export GITHUB_TOKEN=12345
export GITHUB_EVENT_PATH="${BASE_TEST_DIR}/fixture/event.json"

@test "release runs and returns" {
  run release --test --set-version 0.0.1
  [[ ${status} -eq 0 ]]
  [[ "${lines[3]}" = 'github-release info -u github -r ergtools' ]]
  [[ "${lines[4]}" = 'github-release release --user github --repo ergtools --tag v0.0.1 --name publish release v0.0.1 --description Uploading pre-release version for [commit](https://github.com/github/ergtools/commit/ebf6729d9b72cee9242b938f8d6edad67323afa3). --pre-release' ]]
}

@test "release must error when no VERSION file found" {
  run release
  [[ $status -eq 1 ]]
}

@test "release must error without GITHUB_TOKEN set" {
  unset GITHUB_TOKEN
  run release
  [[ $status -eq 1 ]]
}

@test "release must error without GITHUB_EVENT_PATH set" {
  unset GITHUB_EVENT_PATH
  run release
  [[ $status -eq 1 ]]
}
