# shellcheck shell=bash disable=SC2154 disable=SC2168
local host port scheme login password
host="${args[--host]}"
port="${args[--port]}"
scheme="${args[--scheme]}"
login="${KEENETIC_USERNAME:?KEENETIC_USERNAME env must be set}"
password="${KEENETIC_PASSWORD:?KEENETIC_PASSWORD env must be set}"

login "${host}" "${port}" "${scheme}" "1" "${login}" "${password}"
