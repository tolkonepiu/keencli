#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/functions/get_base_url.sh
source "src/lib/functions/get_base_url.sh"

@test "without parameters" {
  run get_base_url
  [ "$status" -ne 0 ]
}

@test "if set all parameters" {
  run get_base_url 192.168.1.1 80 1
  [ "$status" -eq 0 ]
  [ "$output" = "https://192.168.1.1:80" ]
}

@test "without port but with https" {
  empty=""
  run get_base_url 192.168.1.1 "${empty}" 1
  [ "$status" -eq 0 ]
  [ "$output" = "https://192.168.1.1" ]
}

@test "with port but without https" {
  run get_base_url 192.168.1.1 80
  [ "$status" -eq 0 ]
  [ "$output" = "http://192.168.1.1:80" ]
}

@test "only host set" {
  run get_base_url "192.168.1.1"
  [ "$status" -eq 0 ]
  [ "$output" = "http://192.168.1.1" ]
}
