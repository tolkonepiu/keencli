function get_base_url() {
  base_url="${KEENETIC_BASE_URL}"

  if [[ -z "${base_url}" ]]; then
    debug "KEENETIC_BASE_URL env is not set, get the value from the --baseurl flag"
    base_url="${1}"
  else
    debug "KEENETIC_BASE_URL env is set, ignore the value from the --baseurl flag"
  fi

  if ! result=$(validate_base_url "${base_url}"); then
    error "${result}"
  fi

  echo "${base_url}"
}
