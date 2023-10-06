function error() {
  echo -e "($(date +'%Y-%m-%dT%H:%M:%S')) ERROR: $1" >&2
  exit 1
}

function log() {
  [[ "$2" ]] &&
    echo -e "($(date +'%Y-%m-%dT%H:%M:%S')) $1" >&2
  return 0
}
