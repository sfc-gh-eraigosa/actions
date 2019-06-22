#!/bin/bash

set -e
set -o pipefail

event_raw_print() {
    key="${1:-}"
    if [[ ! -z "${key}" ]]; then
      if [[ ! -z "${GITHUB_EVENT_PATH}" ]]; then
        cat "${GITHUB_EVENT_PATH}" | jq --raw-output "${key}"
      else
        echo -n ''
      fi
    else
      echo -n ''
    fi
}

get_pusher_name() {
  event_raw_print '.pusher.name'
}

get_org() {
  event_raw_print '.repository.organization'
}

get_repo() {
  event_raw_print '.repository.name'
}

get_git_url() {
  event_raw_print '.repository.git_url'
}

get_commit_url() {
  event_raw_print '.commits[0].url'
}
