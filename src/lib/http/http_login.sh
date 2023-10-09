function http_login() {
  local baseurl login password
  baseurl="${1:?baseurl must be set}"
  login="${KEENETIC_USERNAME:?KEENETIC_USERNAME env must be set}"
  password="${KEENETIC_PASSWORD:?KEENETIC_PASSWORD env must be set}"

  if ! result=$(
    http_request_ohir \
      "${baseurl}" \
      "/auth"
  ); then
    error "Login failed, $result"
  fi

  status_code=$(get_http_status_code "$result")
  [[ "$status_code" -eq 200 ]] &&
    log "Already logged in" &&
    return 0

  [[ "$status_code" -ne 401 ]] &&
    error "Login failed${status_code:+, status_code: ${status_code}}"

  x_ndm_realm=$(get_http_header_value "x-ndm-realm" "${result}")
  x_ndm_challenge=$(get_http_header_value "x-ndm-challenge" "${result}")

  [[ -z "$x_ndm_realm" || -z "$x_ndm_challenge" ]] &&
    error "Login failed, required headers not found"

  debug "Calculate hash: realm=${x_ndm_realm}, challenge=${x_ndm_challenge}"
  hash=$(
    calculate_hash \
      "${login}" \
      "${password}" \
      "${x_ndm_realm}" \
      "${x_ndm_challenge}"
  )
  debug "Hash result: ${hash}"

  log "Log in to ${baseurl}..."
  if ! result=$(
    http_request_ohir \
      "${baseurl}" \
      "/auth" \
      "{\"login\":\"${login}\",\"password\":\"$hash\"}"
  ); then
    error "Login failed, $result"
  fi

  status_code=$(get_http_status_code "$result")
  [[ "$status_code" -ne 200 ]] &&
    error "Login failed${status_code:+, status_code: ${status_code}}"

  log "Login successful"
}
