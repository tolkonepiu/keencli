# shellcheck shell=bash
function get_base_url() {
  local host port proto
  host="${1:?host must be set}"
  port="${2}"
  proto=$([ -n "$3" ] && echo "https" || echo "http")

  echo "${proto}://${host}${port:+:$port}"
}
