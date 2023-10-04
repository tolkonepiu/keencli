# shellcheck shell=bash
validate_file_path() {
       $test
  [[ -d "$1" ]] && echo "File cannot be a directory"
  [[ -d "$(dirname "$1")" ]] ||
    echo "File must be with an existing parent directory"
}
