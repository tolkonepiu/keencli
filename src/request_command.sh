# shellcheck disable=SC2154
http_command \
  "${args[--baseurl]}" \
  "${args[url_path]}" \
  "${args[request_data]}" \
  "${args[--output]}" \
  "${args[--format]}"
