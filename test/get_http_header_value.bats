#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/http/get_http_header_value.sh
source "src/lib/http/get_http_header_value.sh"

@test "without parameters" {
  run get_http_header_value
  [ "$status" -ne 0 ]
}

@test "with only key parameter" {
  run get_http_header_value key
  [ "$status" -ne 0 ]
}

@test "if set all parameters" {
  value=$(echo -e "test: test\nkey: success")
  run get_http_header_value key "${value}"
  [ "$status" -eq 0 ]
  [ "$output" = "success" ]
}
