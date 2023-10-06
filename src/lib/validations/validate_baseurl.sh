# shellcheck shell=bash

baseurl_regex="^https?:\/\/((([0-9]{1,3}\.){3}[0-9]{1,3})|([a-zA-Z0-9.-]+(\.[a-zA-Z]{2,4}){1,2}))(:[0-9]+)?$"

validate_baseurl() {
  if [[ ! "${1}" =~ ${baseurl_regex} ]]; then
    echo "Invalid base URL, please see examples"
  fi
}
