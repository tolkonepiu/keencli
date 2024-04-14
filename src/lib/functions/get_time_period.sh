function get_time_period() {
  case "${1:?time_period must be set}" in
  3m)
    echo 0
    ;;
  1h)
    echo 1
    ;;
  3h)
    echo 2
    ;;
  24h)
    echo 3
    ;;
  *)
    echo "Unknown time period ${1}" && exit 1
    ;;
  esac
}
