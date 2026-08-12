#!/bin/bash

chosen=$(echo -e "󱐋 Performance\n󰌪 Powersave" | rofi -dmenu -i -p "CPU Governor" -theme-str 'entry { enabled: false; } listview { lines: 2; columns: 1; } window { width: 220px; } element { padding: 8px; }')

case "$chosen" in
    *"Performance"*)
        echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
        notify-send "CPU" "Switched to Performance mode"
        ;;
    *"Powersave"*)
        echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
        notify-send "CPU" "Switched to Powersave mode"
        ;;
esac
