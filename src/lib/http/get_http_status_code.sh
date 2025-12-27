function get_http_status_code() {
  local response first_line

  response="${1:?response must be set}"

  IFS=$'\n' read -ra lines <<<"${response}"
  first_line="${lines[0]}"

  if [[ "${first_line}" =~ ^HTTP[[:space:]]+([0-9]+) ]]; then
    echo "${BASH_REMATCH[1]}"
  elif [[ "${first_line}" =~ ^HTTP/[0-9.]+[[:space:]]+([0-9]+) ]]; then
    echo "${BASH_REMATCH[1]}"
  fi
}
