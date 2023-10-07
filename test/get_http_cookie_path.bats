#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/http/get_http_cookie_path.sh
source "src/lib/http/get_http_cookie_path.sh"
# shellcheck source=../src/lib/functions/md5_hash.sh
source "src/lib/functions/md5_hash.sh"

setup() {
  deps[md5]=$(which md5sum)
}

@test "without parameters" {
  run get_http_cookie_path
  [ "$status" -ne 0 ]
}

@test "if set all parameters" {
  run get_http_cookie_path http://localhost:80
  [ "$status" -eq 0 ]
  [[ "$output" =~ keencli-06aca1042eaa4240465ba7b5d4fdae52.cookie$ ]]
}

@test "check idempotency" {
  ARGS=(test test)
  [ "$(get_http_cookie_path "${ARGS[@]}")" \
    = "$(get_http_cookie_path "${ARGS[@]}")" ]
}
