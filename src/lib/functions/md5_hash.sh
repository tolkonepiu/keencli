# shellcheck disable=SC2154
function md5_hash() {
  echo -n "$1" | "${deps[md5]}" | awk '{print $1}'
}
