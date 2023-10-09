#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/functions/logging.sh
source "src/lib/functions/logging.sh"
# shellcheck source=../src/lib/validations/validate_base_url.sh
source "src/lib/validations/validate_base_url.sh"
# shellcheck source=../src/lib/functions/get_base_url.sh
source "src/lib/functions/get_base_url.sh"

setup() {
  export KEENETIC_BASE_URL_TEST="${KEENETIC_BASE_URL}"
  unset KEENETIC_BASE_URL
}

teardown() {
  export KEENETIC_BASE_URL="${KEENETIC_BASE_URL_TEST}"
  unset KEENETIC_BASE_URL_TEST
}

@test "if base_url set by parameter" {
  run get_base_url "http://192.168.1.1"
  [ "$status" -eq 0 ]
  [ "$output" = "http://192.168.1.1" ]
}

@test "if invalid base_url set by parameter" {
  run get_base_url "http://192.168.1.1/fail"
  [ "$status" -ne 0 ]
}

@test "if base_url set by env" {
  export KEENETIC_BASE_URL="https://example.com"
  run get_base_url "192.168.1.1"
  [ "$status" -eq 0 ]
  [ "$output" = "https://example.com" ]
}
