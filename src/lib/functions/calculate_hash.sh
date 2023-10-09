function calculate_hash() {
  local login password x_ndm_realm x_ndm_challenge

  login=${1:?login must be set}
  password=${2:?password must be set}
  x_ndm_realm=${3:?x_ndm_realm must be set}
  x_ndm_challenge=${4:?x_ndm_challenge must be set}

  md5string="${login}:${x_ndm_realm}:${password}"
  md5hash=$(md5_hash "$md5string")
  sha256string="$x_ndm_challenge$md5hash"
  echo -n "$sha256string" | shasum -a 256 | awk '{print $1}'
}
