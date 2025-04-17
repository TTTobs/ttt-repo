#!/bin/bash

################################
# HYPERLAND CONFIG FILES CURLS #
################################
pacman -Syu
# Install the necessary packages
pacman -S hyprland hyprpaper hyprlock

# Define the configuration path and hypr folder path
config_path="/home/ttt/.config"
hypr_path="$config_path/hypr"

echo $config_path
echo $hyprpath
# Create the hypr folder if it doesn't exist
mkdir -p "$hypr_path"

# Navigate to the hypr folder
cd "$hypr_path"

# Print the current working directory
echo $(pwd)

# Download the configuration files using curl
curl -o "$hypr_path/hyprland.conf" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/hyprland.conf
curl -o "$hypr_path/hyprlock.conf" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/hyprlock.conf
curl -o "$hypr_path/hyprpaper.conf" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/hyprpaper.conf
curl -o "$hypr_path/arasaka_wp.jpg" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/arasaka_wp.jpg


