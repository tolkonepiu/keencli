#!/usr/bin/env bats

load test_helper.bash

# shellcheck source=../src/lib/validations/validate_file_path.sh
source "src/lib/validations/validate_file_path.sh"

setup() {
  temp_dir=$(mktemp -d)
}

teardown() {
  rm -r "${temp_dir}"
}

@test "when parent dir is exists" {
  mkfile="${temp_dir}/test"
  run validate_file_path "${mkfile}"
  [ "$status" -eq 0 ]
  [ -z "$output" ]
}

@test "when parent dir is not exists" {
  mkfile="${temp_dir}/test/test"
  run validate_file_path "${mkfile}"
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}

@test "when file path is directory" {
  mkfile="${temp_dir}/test/"
  mkdir "${mkfile}"
  run validate_file_path "${mkfile}"
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}
