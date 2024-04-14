# shellcheck disable=SC2154
traffic_type="${args[--traffic_type]}"
metric_type="${args[--metric_type]}"
count="${args[--count]}"
time_period=$(get_time_period "${args[--time_period]}")

url_path="/rci/show/ntce/summary?${traffic_type}=true&attrib=${metric_type}&count=${count}&detail=${time_period}"

http_command \
  "${args[--baseurl]}" \
  "${url_path}" \
  "${args[request_data]}" \
  "${args[--output]}" \
  "${args[--format]}"
