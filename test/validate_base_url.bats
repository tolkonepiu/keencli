#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/validations/validate_base_url.sh
source "src/lib/validations/validate_base_url.sh"

@test "when baseurl is valid" {
  run validate_base_url http://192.168.1.1
  [ "$status" -eq 0 ]
  [ -z "$output" ]
}

@test "when baseurl is https and valid" {
  run validate_base_url https://router1.keenetic.link
  [ "$status" -eq 0 ]
  [ -z "$output" ]
}

@test "when baseurl is invalid" {
  run validate_base_url http://192.168.1.1/test
  [ "$status" -ne 0 ]
  [ -n "$output" ]
}
