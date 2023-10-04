#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/validations/validate_json.sh
source "src/lib/validations/validate_json.sh"

@test "when json is valid" {
  run validate_json '{"key":"value"}'
  [ "$status" -eq 0 ]
  [ -z "$output" ]
}

@test "when json is invalid" {
  run validate_json '{"key":"value"'
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}
