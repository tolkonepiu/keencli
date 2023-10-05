# shellcheck shell=bash
function request() {
  local host port scheme url_path request_data output \
    verbose login password response
  host="${1:?host must be set}"
  port="${2}"
  scheme="${3:?scheme must be set}"
  url_path="${4}"
  request_data="${5}"
  output="${6}"
  verbose="${7}"
  login="${8:?login must be set}"
  password="${9:?password must be set}"

  login "${host}" "${port}" "${scheme}" "${verbose}" \
    "${login}" "${password}"

  log "Trying ${host}..." "${verbose}"

  if ! response=$(
    http_request \
      "${host}" \
      "${port}" \
      "${scheme}" \
      "${url_path}" \
      "${request_data}" \
      "${output}"
  ); then
    error "Request failed, $response"
  fi

  status_code=$(get_http_status_code "$response")
  [[ "$status_code" != 2* ]] &&
    error "Request failed${status_code:+, status_code: ${status_code}}"

  log "Request successful, status_code: ${status_code}" "${verbose}"
}





