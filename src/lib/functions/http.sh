# shellcheck shell=bash
function request() {
  local hostname port is_https url_path request_data \
    output_path base_url cookie_path

  hostname="${1:?hostname must be set}"
  port="${2}"
  is_https="${3}"
  url_path="${4:?url path must be set}"
  request_data="${5}"
  output_path="${6}"

  base_url=$(get_base_url "${hostname}" "${port}" "${is_https}")
  cookie_path=$(get_cookie_path "${hostname}" "${port}")

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
function request_ohir() {
  request "${1}" "${2}" "${3}" "${4}" "${5}" "/dev/null"
}
