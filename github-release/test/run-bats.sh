#!/usr/bin/env bash

set -e

# Usage: ./run-bats.sh [folder to test]

export TAP="${TAP:-p}"
export VERBOSE="${VERBOSE:-0}"
export BATS_FILE="$1"

# Check we're not running bash 3.x
if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
    echo "Bash 4.1 or later is required to run these tests"
    exit 1
fi

# If bash 4.x, check the minor version is 1 or later
if [ "${BASH_VERSINFO[0]}" -eq 4 ] && [ "${BASH_VERSINFO[1]}" -lt 1 ]; then
    echo "Bash 4.1 or later is required to run these tests"
    exit 1
fi

if [[ -z "$BATS_FILE" ]]; then
    echo "You must specify a bats test to run."
    exit 1
fi

if [[ ! -e "$BATS_FILE" ]]; then
    echo "Requested bats file or directory not found: $BATS_FILE"
    exit 1
fi

export BASE_TEST_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

exec bats -r${TAP} "$BATS_FILE"
exit $?
