# shellcheck shell=bash
function http_request() {
  local baseurl url_path request_data \
    output_path cookie_path

  baseurl="${1:?baseurl must be set}"
  url_path="${2:?url path must be set}"
  request_data="${3}"
  output_path="${4}"

  cookie_path=$(get_http_cookie_path "${baseurl}")

  ARGS=(-sS -D -)

  if [[ -n "${request_data}" ]]; then
    ARGS+=(--json "${request_data}")
  fi

  if [[ -n "${output_path}" ]]; then
    ARGS+=(-o "${output_path}")
  fi

  curl 2>&1 \
    "${ARGS[@]}" \
    "${baseurl}${url_path}" \
    --cookie "${cookie_path}" \
    --cookie-jar "${cookie_path}"
}

# request with only headers in response
function http_request_ohir() {
  http_request "${1}" "${2}" "${3}" "/dev/null"
}
