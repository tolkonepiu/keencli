# shellcheck disable=SC2154
url_path="/rci/show/system"

subcommand="${args[subcommand]}"
if [[ -n "${subcommand}" ]]; then
  url_path="${url_path}/${subcommand}"
fi

http_command \
  "${args[--baseurl]}" \
  "${url_path}" \
  "${args[request_data]}" \
  "${args[--output]}" \
  "${args[--format]}"
