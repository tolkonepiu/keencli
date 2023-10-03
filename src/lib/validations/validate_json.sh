# shellcheck shell=bash disable=SC2154
validate_json() {
  if ! result=$(echo "$1" | "${deps[json]}" 2>&1); then
    echo "${result}"
  fi
}
