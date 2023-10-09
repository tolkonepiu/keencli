function error() {
  echo -e "($(date +'%Y-%m-%dT%H:%M:%S')) $(red_bold "ERROR: $1")" >&2
  exit 1
}

function log() {
  echo -e "($(date +'%Y-%m-%dT%H:%M:%S')) $(green_bold "$1")" >&2
}

function debug() {
  [[ "$DEBUG" ]] &&
    echo -e "($(date +'%Y-%m-%dT%H:%M:%S')) $(yellow_bold "DEBUG: $1")" >&2
  return 0
}
