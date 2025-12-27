# shellcheck disable=SC2154
function md5_hash() {
  local hash_output

  hash_output=$(echo -n "$1" | "${deps[md5]}")
  echo "${hash_output%% *}"
}
