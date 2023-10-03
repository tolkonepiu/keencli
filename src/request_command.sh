# shellcheck shell=bash disable=SC2154 disable=SC2168
local hostname port is_https verbose url_path request_data login password
hostname="${args[--hostname]}"
port="${args[--port]}"
is_https="${args[--https]}"
output="${args[--output]}"
verbose="${args[--verbose]}"
url_path="${args[url_path]}"
request_data="${args[request_data]}"
login="${KEENETIC_USERNAME:?KEENETIC_USERNAME env must be set}"
password="${KEENETIC_PASSWORD:?KEENETIC_PASSWORD env must be set}"

request_data "${hostname}" "${port}" "${is_https}" "${url_path}" \
  "${request_data}" "${output}" "${verbose}" "${login}" "${password}"
