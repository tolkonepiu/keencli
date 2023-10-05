# shellcheck shell=bash
function get_http_cookie_path() {
  local host port

  host="${1:?host must be set}"
  port="${2}"

  echo "${TMPDIR:-/tmp/}keencli-${host}${port:+:$port}.cookie"
}
