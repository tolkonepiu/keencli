function get_http_cookie_path() {
  local base_url

  base_url="${1:?base_url must be set}"

  echo "${TMPDIR:-/tmp/}keencli-$(md5_hash "${base_url}").cookie"
}
