#! /bin/bash


################################
# HYPERLAND CONFIG FILES CURLS #
################################
pacman -S hyprland hyprpaper hyprlock

config_path = "/home/ttt/.config/"
hypr_path = "$config_path/hypr"

mkdir -p "$hypr_path"
cd "$hypr_path"

echo $(pwd)

curl -o "$hypr_path/hyprland.conf" http://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/hyprland.conf
curl -o "$hypr_path/hyprlock.conf" http://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/hyprlock.conf
curl -o "$hypr_path/hyprpaper.conf" http://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/hyprpaper.conf

