#!/usr/bin/env bats

load ${BASE_TEST_DIR}/helpers.bash

@test "check version" {
  run version
  [[ ${status} -eq 0 ]]
  [[ "${lines[0]}" =~ "github-release v" ]]
}
