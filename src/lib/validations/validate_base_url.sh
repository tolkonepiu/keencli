base_url_regex="^https?:\/\/((([0-9]{1,3}\.){3}[0-9]{1,3})|([a-zA-Z0-9.-]+(\.[a-zA-Z]{2,4}){1,2}))(:[0-9]+)?$"

validate_base_url() {
  if [[ ! "${1}" =~ ${base_url_regex} ]]; then
    echo "Invalid base URL value, please see examples"
    return 1
  fi
}
