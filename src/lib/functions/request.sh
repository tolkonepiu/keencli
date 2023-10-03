# shellcheck shell=bash
function request_data() {
  local hostname port is_https url_path request_data output \
    output_path verbose login password response
  hostname="${1:?hostname must be set}"
  port="${2}"
  is_https="${3}"
  url_path="${4}"
  request_data="${5}"
  output="${6}"
  verbose="${7}"
  login="${8:?login must be set}"
  password="${9:?password must be set}"

  output_path=$(mktemp)

  login "${hostname}" "${port}" "${is_https}" "${verbose}" \
    "${login}" "${password}"

  [[ -n "${output}" ]] &&
    output_path="${output}"

  log "Trying ${hostname}..." "${verbose}"

  if ! response=$(
    request \
      "${hostname}" \
      "${port}" \
      "${is_https}" \
      "${url_path}" \
      "${request_data}" \
      "${output_path}"
  ); then
    error "Request failed, $response"
  fi

  status_code=$(get_status_code "$response")
  [[ "$status_code" != 2* ]] &&
    error "Request failed${status_code:+, status_code: ${status_code}}"

  [[ -z "${output}" ]] &&
    cat "${output_path}" &&
    rm "${output_path}"

  log "Request successful, status_code: ${status_code}" "${verbose}"
}
