# shellcheck shell=bash
function http_command() {
  local baseurl url_path request_data output
  baseurl="${1:?baseurl must be set}"
  url_path="${2}"
  request_data="${3}"
  output="${4:-/dev/stdout}"
  format="${5}"

  login "${baseurl}"

  debug "Trying ${baseurl}..."


  data_path=$(mktemp)

  if ! result=$(
    http_request \
      "${baseurl}" \
      "${url_path}" \
      "${request_data}" \
      "${data_path}"
  ); then
    error "Request failed, $result"
  fi

  status_code=$(get_http_status_code "$result")
  [[ "$status_code" != 2* ]] &&
    error "Request failed${status_code:+, status_code: ${status_code}}"

  debug "Request successful, status_code: ${status_code}"

  if [[ -n "${format}" ]]; then
    if ! convert_json_to "${format}" <"${data_path}" >"${output}"; then
      error "Response conversion error"
    fi
  else
    cat "${data_path}" >"${output}"
  fi

  rm "${data_path}"
}
