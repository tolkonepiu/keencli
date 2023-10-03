# shellcheck shell=bash disable=SC2154 disable=SC2168
local hostname port is_https login password
hostname="${args[--hostname]}"
port="${args[--port]}"
is_https="${args[--https]}"
login="${KEENETIC_USERNAME:?KEENETIC_USERNAME env must be set}"
password="${KEENETIC_PASSWORD:?KEENETIC_PASSWORD env must be set}"

login "${hostname}" "${port}" "${is_https}" "1" "${login}" "${password}"
