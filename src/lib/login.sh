function login() {
  local host port scheme verbose login password response
  host="${1:?host must be set}"
  port="${2}"
  scheme="${3:?scheme must be set}"
  verbose="${4}"
  login="${5:?login must be set}"
  password="${6:?password must be set}"

  if ! response=$(
    http_request_ohir \
      "${host}" \
      "${port}" \
      "${scheme}" \
      "/auth"
  ); then
    error "Login failed, $response"
  fi

  status_code=$(get_http_status_code "$response")
  [[ "$status_code" -eq 200 ]] &&
    log "Already logged in" "${verbose}" &&
    return 0

  [[ "$status_code" -ne 401 ]] &&
    error "Login failed${status_code:+, status_code: ${status_code}}"

  x_ndm_realm=$(get_http_header_value "x-ndm-realm" "${response}")
  x_ndm_challenge=$(get_http_header_value "x-ndm-challenge" "${response}")

  [[ -z "$x_ndm_realm" || -z "$x_ndm_challenge" ]] &&
    error "Login failed, required headers not found"

  hash=$(
    calculate_hash \
      "${login}" \
      "${password}" \
      "${x_ndm_realm}" \
      "${x_ndm_challenge}"
  )

  log "Log in to ${host}..." "${verbose}"

  if ! response=$(
    http_request_ohir \
      "${host}" \
      "${port}" \
      "${scheme}" \
      "/auth" \
      "{\"login\":\"${login}\",\"password\":\"$hash\"}"
  ); then
    error "Login failed, $response"
  fi

  status_code=$(get_http_status_code "$response")
  [[ "$status_code" -ne 200 ]] &&
    error "Login failed${status_code:+, status_code: ${status_code}}"

  log "Login successful" "${verbose}"
}
