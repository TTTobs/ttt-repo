#!/bin/bash

# Get the list of available power profiles
profiles=$(powerprofilesctl list | awk -F':' '{print $1}')

# Get the currently active profile
current_profile=$(powerprofilesctl get)

# Format the profiles for Wofi, marking the current one
wofi_options=""
for profile in $profiles; do
  if [ "$profile" == "$current_profile" ]; then
    wofi_options+="$profile (Active)\n"
  else
    wofi_options+="$profile\n"
  fi
done

# Launch Wofi and get the user's selection
selected=$(echo "$wofi_options" | wofi --show dmenu --prompt "Power Profile:")

# Extract the selected profile (remove "(Active)" if present)
selected_profile=$(echo "$selected" | sed 's/ (Active)//')

# Set the selected power profile
if [ -n "$selected_profile" ] && [[ "$profiles" =~ (^|[[:space:]])"$selected_profile"($|[[:space:]]) ]]; then
  powerprofilesctl set "$selected_profile"
  notify-send "Power Profile" "Set to: $selected_profile"
elif [ -n "$selected" ]; then
  notify-send "Power Profile" "Invalid selection."
fi
