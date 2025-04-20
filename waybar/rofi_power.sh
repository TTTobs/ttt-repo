#!/bin/bash

# Hardcoded power profile option
rofi_options=("balanced" "performance" "power-saver")

# Get the currently active profile (for highlighting)
current_profile=$(powerprofilesctl get 2>/dev/null)

# Format the options for Rofi, marking the current one
formatted_options=()
for profile in "${rofi_options[@]}"; do
  if [ "$profile" == "$current_profile" ]; then
    formatted_options+=("$profile (Active)")
  else
    formatted_options+=("$profile")
  fi
done

# Launch Rofi and get the user's selection
selected=$(printf "%s\n" "${formatted_options[@]}" | rofi -dmenu -i -p "Power Profile:")

# Extract the selected profile (remove "(Active)" if present)
selected_profile=$(echo "$selected" | sed 's/ (Active)//')

# Set the selected power profile
if [ -n "$selected_profile" ] && [[ " ${rofi_options[@]} " =~ " ${selected_profile} " ]]; then
  powerprofilesctl set "$selected_profile"
  notify-send "Power Profile" "Set to: $selected_profile"
elif [ -n "$selected" ]; then
  notify-send "Power Profile" "Invalid selection."
fi
