# shellcheck disable=SC2154
metric_type="${args[--metric_type]}"
count="${args[--count]}"
time_period=$(get_time_period "${args[--time_period]}")

url_path="/rci/show/ip/hotspot/summary?attribute=${metric_type}&count=${count}&detail=${time_period}"

http_command \
  "${args[--baseurl]}" \
  "${url_path}" \
  "${args[request_data]}" \
  "${args[--output]}" \
  "${args[--format]}"
