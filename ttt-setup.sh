#!/bin/bash

################################
# HYPERLAND CONFIG FILES CURLS #
################################
#updates System
pacman -Syu --noconfirm

#Install general software packages
pacman -S wine discord firefox vlc --noconfirm

#Install required libs for functions
pacman -S power-profiles-daemon grim slurp wl-clipboard cifs-utils ttf-font-awesome --noconfirm

#Install the necessary packages for desktop env
pacman -S hyprland hyprpaper hyprlock waybar --noconfirm

# Define the configuration path and hypr folder path
config_path="/home/ttt/.config"
hypr_path="$config_path/hypr"
waybar_path="$config_path/waybar"
kitty_path="$config_path/kitty"

# Print the current working directory
echo $(pwd)

# Download the configuration files using curl
#Download Hyprland configs
curl -o "$hypr_path/hyprland.conf" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/hyprland.conf
curl -o "$hypr_path/hyprlock.conf" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/hyprlock.conf
curl -o "$hypr_path/hyprpaper.conf" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/hyprpaper.conf
curl -o "$hypr_path/arasaka_wp.jpg" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/arasaka_wp.jpg

#Download Waybar configs
curl -o "$waybar_path/config" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/waybar_config
curl -o "$waybar_path/style.css" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/waybar_style.css

#Download Kitty configs
curl -o "kitty_path/kitty.conf" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/kitty.conf
