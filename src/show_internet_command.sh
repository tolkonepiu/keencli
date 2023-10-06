# shellcheck shell=bash disable=SC2154
url_path="/rci/show/internet/status"

http_command \
  "${args[--baseurl]}" \
  "${url_path}" \
  "${args[request_data]}" \
  "${args[--output]}" \
  "${args[--format]}"
