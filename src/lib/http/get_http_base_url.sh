# shellcheck shell=bash
function get_http_base_url() {
  local scheme host port
  scheme="${1:?scheme must be set}"
  host="${2:?host must be set}"
     port="${3}"

  echo "${scheme}://${host}${port:+:$port}"
}
