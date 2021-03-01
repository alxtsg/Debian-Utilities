#!/bin/sh

set -e
set -u

program_name="${0}"
args_count="${#}"
volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | awk '{split($5, a, "%"); print a[1]}')
volume_change_percent=5
volume_max_percent=100
volume_min_percent=0

print_usage() {
  echo "Usage: ${program_name} <show|mute|unmute|up|down>"
}

show() {
  echo "${volume}"
}

mute() {
  pactl set-sink-mute @DEFAULT_SINK@ on
}

unmute() {
  pactl set-sink-mute @DEFAULT_SINK@ off
}

volume_up() {
  new_volume_percent=$((volume + volume_change_percent))
  if [ "${new_volume_percent}" -gt "${volume_max_percent}" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ 100%
    return
  fi
  pactl set-sink-volume @DEFAULT_SINK@ +"${volume_change_percent}"%
}

volume_down() {
  new_volume_percent=$((volume - volume_change_percent))
  if [ "${new_volume_percent}" -le "${volume_min_percent}" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ 0%
    return
  fi
  pactl set-sink-volume @DEFAULT_SINK@ -"${volume_change_percent}"%
}

if [ "${args_count}" -ne 1 ]; then
  print_usage
  exit
fi

option="${1}"

case "${option}" in
  'show')
    show
    ;;
  'mute')
    mute
    ;;
  'unmute')
    unmute
    ;;
  'up')
    unmute
    volume_up
    ;;
  'down')
    unmute
    volume_down
    ;;
  *)
    print_usage
    ;;
esac
