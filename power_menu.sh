#!/bin/bash

rofi_options=("shutdown" "sleep" "restart" "lock")

selected=$(printf "%s\n" "${rofi_options[@]}" | rofi -dmenu -i -lines 4 -width 300 -p "Select Mode")

case "$selected" in
  "shutdown")
    systemctl poweroff
    ;;
  "sleep")
    systemctl suspend
    ;;
  "restart")
    systemctl reboot
    ;;
  "lock")
    exec hyprlock # Or your preferred screen locker (e.g., betterlock, i3lock)
    ;;
esac
