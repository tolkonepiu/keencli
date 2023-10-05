#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/http/get_http_cookie_path.sh
source "src/lib/http/get_http_cookie_path.sh"

@test "without parameters" {
  run get_http_cookie_path
  [ "$status" -ne 0 ]
}

@test "if set all parameters" {
  run get_http_cookie_path localhost 80
  [ "$status" -eq 0 ]
  [[ "$output" =~ keencli-localhost:80.cookie$ ]]
}

@test "without port" {
  run get_http_cookie_path localhost
  [ "$status" -eq 0 ]
  [[ "$output" =~ keencli-localhost.cookie$ ]]
}

@test "check idempotency" {
  ARGS=(test test)
  [ "$(get_http_cookie_path "${ARGS[@]}")" \
    = "$(get_http_cookie_path "${ARGS[@]}")" ]
}
