# shellcheck disable=SC2154
http_command \
  "${args[--baseurl]}" \
  "/ci/${args[system_filename]}.txt" \
  "${args[request_data]}" \
  "${args[--output]}" \
  "${args[--format]}"
