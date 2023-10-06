# shellcheck shell=bash
function get_http_cookie_path() {
  local baseurl

  baseurl="${1:?baseurl must be set}"

  echo "${TMPDIR:-/tmp/}keencli-$(md5_hash "${baseurl}").cookie"
}
