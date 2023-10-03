# shellcheck shell=bash
function login() {
  local hostname port is_https verbose login password response
  hostname="${1:?hostname must be set}"
  port="${2}"
  is_https="${3}"
  verbose="${4}"
  login="${5:?login must be set}"
  password="${6:?password must be set}"

  if ! response=$(
    request_ohir \
      "${hostname}" \
      "${port}" \
      "${is_https}" \
      "/auth"
  ); then
    error "Login failed, $response"
  fi

  status_code=$(get_status_code "$response")
  [[ "$status_code" -eq 200 ]] &&
    log "Already logged in" "${verbose}" &&
    return 0

  [[ "$status_code" -ne 401 ]] &&
    error "Login failed${status_code:+, status_code: ${status_code}}"

  x_ndm_realm=$(get_header_value "x-ndm-realm" "${response}")
  x_ndm_challenge=$(get_header_value "x-ndm-challenge" "${response}")

  [[ -z "$x_ndm_realm" || -z "$x_ndm_challenge" ]] &&
    error "Login failed, required headers not found"

  hash=$(
    calculate_hash \
      "${login}" \
      "${password}" \
      "${x_ndm_realm}" \
      "${x_ndm_challenge}"
  )

  log "Log in to ${hostname}..." "${verbose}"

  if ! response=$(
    request_ohir \
      "${hostname}" \
      "${port}" \
      "${is_https}" \
      "/auth" \
      "{\"login\":\"${login}\",\"password\":\"$hash\"}"
  ); then
    error "Login failed, $response"
  fi

  status_code=$(get_status_code "$response")
  [[ "$status_code" -ne 200 ]] &&
    error "Login failed${status_code:+, status_code: ${status_code}}"

  log "Login successful" "${verbose}"
}
