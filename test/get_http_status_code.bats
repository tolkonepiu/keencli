#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/http/get_http_status_code.sh
source "src/lib/http/get_http_status_code.sh"

@test "when response without status_code" {
  value=$(echo -e "test: test\nkey: success")
  run get_http_status_code "${value}"
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "when response have invalid lines" {
  value=$(echo -e "HTTP/1.1\nkey: success")
  run get_http_status_code "${value}"
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "with http code 200" {
  value=$(echo -e "HTTP/1.1 200\nkey: success")
  run get_http_status_code "${value}"
  [ "$status" -eq 0 ]
  [ "$output" -eq 200 ]
}
