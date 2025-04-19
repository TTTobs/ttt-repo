#!/bin/bash

################################
# HYPERLAND CONFIG FILES CURLS #
################################
#updates System
pacman -Syu --noconfirm

#Install general software packages
pacman -S wine discord firefox vlc libreoffice-fresh --noconfirm

#Install the necessary packages for desktop env
pacman -S hyprland hyprpaper hyprlock waybar rofi --noconfirm

#Install required libs for functions
pacman -S power-profiles-daemon grim slurp wl-clipboard cifs-utils ttf-font-awesome neovim pavucontrol --noconfirm

# Define the configuration path and hypr folder path
config_path="/home/ttt/.config"
hypr_path="$config_path/hypr"

#make directorys (sometimes needed idfk)
mkdir -p $config_path
cd $config_path
mkdir -p hypr waybar kitty rofi

# Download the configuration files using curl
#Download Hyprland configs
curl -o "$hypr_path/hyprland.conf" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/hyprland.conf
curl -o "$hypr_path/hyprlock.conf" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/hyprlock.conf
curl -o "$hypr_path/hyprpaper.conf" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/hyprpaper.conf
curl -o "$hypr_path/arasaka_wp.jpg" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/arasaka_wp.jpg

#Download Waybar configs
curl -o "$config_path/waybar/config" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/waybar_config
curl -o "$config_path/waybar/style.css" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/waybar_style.css
curl -o "$config_path/waybar/rofi_power.sh" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/rofi_power.sh
curl -o "$config_path/waybar/power_menu.sh" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/power_menu.sh

cd "$config_path/waybar"
chmod +x rofi_power.sh
chmod +x power_menu.sh

#Download Kitty configs
curl -o "$config_path/kitty/kitty.conf" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/kitty.conf

#rofi menu config
curl -o "$config_path/rofi/config.rasi" https://raw.githubusercontent.com/TTTobs/ttt-repo/main/config.rasi


