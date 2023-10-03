#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/functions/get_cookie_path.sh
source "src/lib/functions/get_cookie_path.sh"

@test "without parameters" {
  run get_cookie_path
  [ "$status" -ne 0 ]
}

@test "if set all parameters" {
  run get_cookie_path localhost 80
  [ "$status" -eq 0 ]
  [[ "$output" =~ keenclient-localhost:80.cookie$ ]]
}

@test "without port" {
  run get_cookie_path localhost
  [ "$status" -eq 0 ]
  [[ "$output" =~ keenclient-localhost.cookie$ ]]
}

@test "check idempotency" {
  ARGS=(test test)
  [ "$(get_cookie_path "${ARGS[@]}")" = "$(get_cookie_path "${ARGS[@]}")" ]
}
