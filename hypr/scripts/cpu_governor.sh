#!/bin/bash

STATE_FILE="$HOME/.config/yakushidotfiles/governor"

chosen=$(printf "%s
" "󱐋 Performance" "󰌪 Powersave" | rofi -dmenu -i -p "CPU Governor" -theme-str 'entry { enabled: false; } listview { lines: 2; columns: 1; } window { width: 220px; } element { padding: 8px; }')

case "$chosen" in
*"Performance"*)
governor="performance"
message="Switched to Performance mode"
;;
*"Powersave"*)
governor="powersave"
message="Switched to Powersave mode"
;;
*)
exit 0
;;
esac

mkdir -p "$(dirname "$STATE_FILE")"
printf "%s
" "$governor" > "$STATE_FILE"

echo "$governor" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor >/dev/null

notify-send "CPU" "$message"
