function convert_to() {
  input_format="${1:?input_format must be set}"
  output_format="${2:?output_format must be set}"

  yq 2>&1 -r -e \
    -p "${input_format}" \
    -o "${output_format}" \
    </dev/stdin
}

function convert_json_to() {
  convert_to "json" "${1}"
}
