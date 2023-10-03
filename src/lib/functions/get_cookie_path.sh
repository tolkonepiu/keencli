# shellcheck shell=bash
function get_cookie_path() {
  local hostname port

  hostname="${1:?hostname must be set}"
  port="${2}"

  echo "${TMPDIR:-/tmp/}keenclient-${hostname}${port:+:$port}.cookie"
}
