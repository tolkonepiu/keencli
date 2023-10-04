#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/functions/convert_to.sh
source "src/lib/functions/convert_to.sh"

@test "without parameters" {
  run convert_to
  [ "$status" -ne 0 ]
}

@test "convert json to yaml" {
  result=$(echo '{"key":"value"}' | convert_to "json" "yaml")
  [ "$?" ]
  run echo "$result"
  [ "$status" -eq 0 ]
  [ "$output" = "key: value" ]
}

@test "convert yaml to json" {
  expected=$(
    cat <<EOF
{
  "key": "value"
}
EOF
  )

  result=$(echo "key: value" | convert_to "yaml" "json")
  [ "$?" ]
  run echo "$result"
  [ "$status" -eq 0 ]
  [ "$output" = "$expected" ]
}

@test "convert json to yaml (convert_json_to)" {
  result=$(echo '{"key":"value"}' | convert_json_to "yaml")
  [ "$?" ]
  run echo "$result"
  [ "$status" -eq 0 ]
  [ "$output" = "key: value" ]
}
