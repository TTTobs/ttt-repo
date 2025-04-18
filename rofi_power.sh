#!/bin/bash

# Hardcoded power profile options
rofi_options="balanced\nperformance\npower-saver"

# Get the currently active profile (for highlighting)
current_profile=$(powerprofilesctl get 2>/dev/null) # Redirect stderr to avoid errors if ppd isn't running

# Format the options for Rofi, marking the current one
formatted_options=""
while IFS= read -r profile; do
  if [ "$profile" == "$current_profile" ]; then
    formatted_options+="$profile (Active)\n"
  else
    formatted_options+="$profile\n"
  fi
done <<< "$rofi_options"

# Launch Rofi and get the user's selection
selected=$(echo "$formatted_options" | rofi -dmenu -i -p "Power Profile:")

# Extract the selected profile (remove "(Active)" if present)
selected_profile=$(echo "$selected" | sed 's/ (Active)//')

# Set the selected power profile
if [ -n "$selected_profile" ] && [[ "$rofi_options" =~ (^|[[:space:]])"$selected_profile"($|[[:space:]]) ]]; then
  powerprofilesctl set "$selected_profile"
  notify-send "Power Profile" "Set to: $selected_profile"
elif [ -n "$selected" ]; then
  notify-send "Power Profile" "Invalid selection."
fi
