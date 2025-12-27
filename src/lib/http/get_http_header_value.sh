function get_http_header_value() {
  local key response line header_value

  key="${1:?header key must be set}"
  response="${2:?response must be set}"

  while IFS= read -r line; do
    line="${line%$'\r'}"
    if [[ "${line,,}" == "${key,,}:"* ]]; then
      header_value="${line#*: }"
      echo "${header_value}"
      return 0
    fi
  done <<<"${response}"
}
