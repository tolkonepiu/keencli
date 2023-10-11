function get_http_status_code() {
  local response
  response="${1:?response must be set}"

  echo "${response}" |
    tail -n +1 |
    head -1 |
    grep -e "^HTTP" |
    awk -F " " '{print $2}'
}
