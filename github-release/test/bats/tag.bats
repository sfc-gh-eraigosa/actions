#!/usr/bin/env bats

load ${BASE_TEST_DIR}/helpers.bash

export GITHUB_TOKEN=12345
export GITHUB_EVENT_PATH="${BASE_TEST_DIR}/fixture/event.json"

@test "tag runs and returns" {
  run tag --set-version 0.0.1 --test
  [[ ${status} -eq 0 ]]
  [[ "${lines[1]}" = 'Working with VERSION=0.0.1' ]]
  [[ "${lines[3]}" = 'git remote add tagorigin https://wenlock:12345@github.com/github/ergtools.git' ]]
  [[ "${lines[4]}" = 'git --no-pager tag --list v0.0.1' ]]
  [[ "${lines[5]}" = 'git tag v0.0.1' ]]
  [[ "${lines[6]}" = 'git push tagorigin tag v0.0.1' ]]
  [[ "${lines[7]}" = 'git remote rm tagorigin' ]]
}

@test "tag must error when no VERSION file found" {
  run tag
  [[ $status -eq 1 ]]
}

@test "tag must error without GITHUB_TOKEN set" {
  unset GITHUB_TOKEN
  run tag
  [[ $status -eq 1 ]]
}

@test "tag must error without GITHUB_EVENT_PATH set" {
  unset GITHUB_EVENT_PATH
  run tag
  [[ $status -eq 1 ]]
}
