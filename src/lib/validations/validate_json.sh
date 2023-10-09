validate_json() {
  if ! result=$(echo "$1" | yq -p json 2>&1); then
    echo "${result}"
  fi
}
