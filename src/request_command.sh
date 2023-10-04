# shellcheck shell=bash disable=SC2154 disable=SC2168
local host port scheme verbose url_path request_data login password
host="${args[--host]}"
port="${args[--port]}"
scheme="${args[--scheme]}"
output="${args[--output]:-/dev/stdout}"
format="${args[--format]}"
verbose="${args[--verbose]}"
url_path="${args[url_path]}"
request_data="${args[request_data]}"
login="${KEENETIC_USERNAME:?KEENETIC_USERNAME env must be set}"
password="${KEENETIC_PASSWORD:?KEENETIC_PASSWORD env must be set}"

data_path=$(mktemp)

request "${host}" "${port}" "${scheme}" "${url_path}" \
  "${request_data}" "${data_path}" "${verbose}" "${login}" "${password}"

if [[ -n "${format}" ]]; then
  if ! convert_json_to "${format}" <"${data_path}" >"${output}"; then
    error "Response conversion error"
  fi
else
  cat "${data_path}" >"${output}"
fi

rm "${data_path}"
