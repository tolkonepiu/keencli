# shellcheck shell=bash disable=SC2154
url_path="/rci/show/interface"

subcommand="${args[subcommand]}"
if [[ -n "${subcommand}" ]]; then
  url_path="${url_path}/${subcommand}"
fi

interface_name="${args[interface_name]}"
if [[ -n "${interface_name}" ]]; then
  url_path="${url_path}?name=${interface_name}"
fi

http_command \
  "${args[--baseurl]}" \
  "${url_path}" \
  "${args[request_data]}" \
  "${args[--output]}" \
  "${args[--format]}"
