# shellcheck shell=bash
function error() {
  echo -e "($(date +'%Y-%m-%dT%H:%M:%S')) ERROR: $1" >&2
  exit 1
}

function log() {
  echo -e "($(date +'%Y-%m-%dT%H:%M:%S')) $1" >&2
}

function debug() {
  [[ "$DEBUG" ]] &&
    echo -e "($(date +'%Y-%m-%dT%H:%M:%S')) DEBUG: $1" >&2
  return 0
}
