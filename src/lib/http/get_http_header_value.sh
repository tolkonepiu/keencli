function get_http_header_value() {
  local key response

  key="${1:?header key must be set}"
  response="${2:?response must be set}"

  echo "${response}" |
    grep "${key}" |
    awk -F ": " '{print $2}' |
    tr -d '\r'
}
