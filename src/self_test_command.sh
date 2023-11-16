# shellcheck disable=SC2154
url_path="/ci/self-test.txt"

http_command \
  "${args[--baseurl]}" \
  "${url_path}" \
  "${args[request_data]}" \
  "${args[--output]}" \
  "${args[--format]}"
