function http_command() {
  local base_url url_path request_data output format
  base_url=$(get_base_url "${1}")
  url_path="${2}"
  request_data="${3}"
  output="${4:-/dev/stdout}"
  format="${5}"

  http_login "${base_url}"

  log "Trying ${base_url}${url_path}${request_data:+, request_data: ${request_data}}..."

  data_path=$(mktemp)

  if ! result=$(
    http_request \
      "${base_url}" \
      "${url_path}" \
      "${request_data}" \
      "${data_path}"
  ); then
    error "Request failed, $result"
  fi

  status_code=$(get_http_status_code "$result")
  [[ "$status_code" != 2* ]] &&
    error "Request failed${status_code:+, status_code: ${status_code}}"

  log "Request successful, status_code: ${status_code}"

  if [[ -n "${format}" ]]; then
    if ! convert_json_to "${format}" <"${data_path}" >"${output}"; then
      error "Response conversion error"
    fi
  else
    cat "${data_path}" >"${output}"
  fi

  rm "${data_path}"
}
