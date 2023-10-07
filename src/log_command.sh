# shellcheck shell=bash disable=SC2154
http_command \
  "${args[--baseurl]}" \
  "/ci/log.txt" \
  "${args[request_data]}" \
  "${args[--output]}" \
  "${args[--format]}"
