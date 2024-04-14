#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/functions/logging.sh
source "src/lib/functions/logging.sh"
# shellcheck source=../src/lib/functions/get_time_period.sh
source "src/lib/functions/get_time_period.sh"

@test "without parameters" {
  run get_time_period
  [ "$status" -ne 0 ]
}

@test "with correct parameter" {
  run get_time_period 3m
  [ "$status" -eq 0 ]
  [ "$output" = "0" ]

  run get_time_period 1h
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]

  run get_time_period 3h
  [ "$status" -eq 0 ]
  [ "$output" = "2" ]

  run get_time_period 24h
  [ "$status" -eq 0 ]
  [ "$output" = "3" ]
}

@test "with uncorrect parameter" {
  run get_time_period 25h
  [ "$status" -ne 0 ]

  run get_time_period adsadasdasd
  [ "$status" -ne 0 ]
}
