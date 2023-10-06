# shellcheck shell=bash disable=SC2154
url_path="/rci/show/ip/hotspot"

mac_address="${args[mac_address]}"
if [[ -n "${mac_address}" ]]; then
  url_path="${url_path}?mac=${mac_address}"
fi

http_command \
  "${args[--baseurl]}" \
  "${url_path}" \
  "${args[request_data]}" \
  "${args[--output]}" \
  "${args[--format]}"
