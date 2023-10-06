#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/validations/validate_baseurl.sh
source "src/lib/validations/validate_baseurl.sh"

@test "when baseurl is valid" {
  run validate_baseurl http://192.168.1.1
  [ "$status" -eq 0 ]
  [ -z "$output" ]
}

@test "when baseurl is https and valid" {
  run validate_baseurl https://router1.keenetic.link
  [ "$status" -eq 0 ]
  [ -z "$output" ]
}

@test "when baseurl is invalid" {
  run validate_baseurl http://192.168.1.1/test
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}
