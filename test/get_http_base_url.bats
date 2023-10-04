#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/http/get_http_base_url.sh
source "src/lib/http/get_http_base_url.sh"

@test "without parameters" {
  run get_http_base_url
  [ "$status" -ne 0 ]
}

@test "if set all parameters" {
  run get_http_base_url https 192.168.1.1 80
  [ "$status" -eq 0 ]
  [ "$output" = "https://192.168.1.1:80" ]
}

@test "without port and http" {
  run get_http_base_url http 192.168.1.1
  [ "$status" -eq 0 ]
  [ "$output" = "http://192.168.1.1" ]
}

@test "without port and https" {
  run get_http_base_url https 192.168.1.1
  [ "$status" -eq 0 ]
  [ "$output" = "https://192.168.1.1" ]
}
