# shellcheck disable=SC2154
http_command \
  "${args[--baseurl]}" \
  "/ci/${args[configuration_file]}.txt" \
  "${args[request_data]}" \
  "${args[--output]}" \
  "${args[--format]}"
