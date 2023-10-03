# shellcheck shell=bash
function get_status_code() {
  local response
  response="${1:?response must be set}"

  echo "$response" | head -n 1 | grep -e "^HTTP" | awk '{print $2}'
}
