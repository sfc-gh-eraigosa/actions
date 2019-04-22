#!/usr/bin/env bats

load ${BASE_TEST_DIR}/helpers.bash

export GITHUB_TOKEN=12345
export GITHUB_EVENT_PATH="../fixture/event.json"

@test "tag runs and returns" {
  run tag
  [[ ${status} -eq 0 ]]
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
