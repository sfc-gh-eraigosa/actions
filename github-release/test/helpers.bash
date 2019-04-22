#!/bin/bash

function echo_output {
  echo "# $BATS_TEST_NAME
# ----------
# ->  $output
# ----------
" >&3
}

function teardown {
  if [[ ! -z "${output}" ]] && [[ $VERBOSE -eq 1 ]]; then
     echo_output
  fi
}

function errecho {
    echo "# $@" >&3
}

function only_if_env {
    if [[ ${!1} != "$2" ]]; then
        errecho "This test requires the $1 environment variable to be set to $2. Skipping..."
        skip
    fi
}

function require_env {
    if [[ -z ${!1} ]]; then
        errecho "This test requires the $1 environment variable to be set in order to run."
        exit 1
    fi
}

# make sure we unset these values
unset VERSION
