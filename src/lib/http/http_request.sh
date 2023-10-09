function http_request() {
  local base_url url_path request_data \
    output_path cookie_path

  base_url="${1:?base_url must be set}"
  url_path="${2:?url path must be set}"
  request_data="${3}"
  output_path="${4}"

  cookie_path=$(get_http_cookie_path "${base_url}")

  ARGS=(-sS -D -)

  if [[ -n "${request_data}" ]]; then
    ARGS+=(--json "${request_data}")
  fi

  if [[ -n "${output_path}" ]]; then
    ARGS+=(-o "${output_path}")
  fi

  curl 2>&1 \
    "${ARGS[@]}" \
    "${base_url}${url_path}" \
    --cookie "${cookie_path}" \
    --cookie-jar "${cookie_path}"
}

# request with only headers in response
function http_request_ohir() {
  http_request "${1}" "${2}" "${3}" "/dev/null"
}
