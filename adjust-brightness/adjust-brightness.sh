#!/bin/sh

set -e
set -u

program_name="${0}"
args_count="${#}"

backlight_device='amdgpu_bl0'
brightness_file="/sys/class/backlight/${backlight_device}/brightness"
max_brightness_file="/sys/class/backlight/${backlight_device}/max_brightness"
current_brightness=$(cat "${brightness_file}")
max_brightness=$(cat "${max_brightness_file}")
min_brightness=0
brightness_step=10

print_usage() {
  echo "Usage: ${program_name} <show|up|down>"
}

brightness_show() {
  echo "${current_brightness}"
}

brightness_up() {
  new_brightness=$((current_brightness + brightness_step))
  if [ "${new_brightness}" -gt "${max_brightness}" ]; then
    new_brightness="${max_brightness}"
  fi
  echo "${new_brightness}" > "${brightness_file}"
}

brightness_down() {
  new_brightness=$((current_brightness - brightness_step))
  if [ "${new_brightness}" -lt "${min_brightness}" ]; then
    new_brightness="${min_brightness}"
  fi
  echo "${new_brightness}" > "${brightness_file}"
}

if [ "${args_count}" -ne 1 ]; then
  print_usage
  exit
fi

option="${1}"

case "${option}" in
  'show')
    brightness_show
    ;;
  'up')
    brightness_up
    ;;
  'down')
    brightness_down
    ;;
  *)
    print_usage
    ;;
esac
