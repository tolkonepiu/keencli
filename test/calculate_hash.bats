#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/functions/calculate_hash.sh
source "src/lib/functions/calculate_hash.sh"

setup() {
  deps[md5]=$(which md5sum)
}

@test "without parameters" {
  run calculate_hash
  [ "$status" -ne 0 ]
}

@test "check hash" {
  hash="41e6b43f253367306c008b3f863d9c29f7e33a3d7d8a72e54c251bb6b70bf104"
  run calculate_hash user pass realm challenge
  [ "$status" -eq 0 ]
  [ "$output" = "$hash" ]
}
