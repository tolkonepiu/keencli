function http_request() {
  local host port scheme url_path request_data \
    output_path base_url cookie_path

  host="${1:?host must be set}"
  port="${2}"
  scheme="${3:?scheme must be set}"
  url_path="${4:?url path must be set}"
  request_data="${5}"
  output_path="${6}"

  base_url=$(get_http_base_url "${scheme}" "${host}" "${port}")
  cookie_path=$(get_http_cookie_path "${host}" "${port}")

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
  http_request "${1}" "${2}" "${3}" "${4}" "${5}" "/dev/null"
}
