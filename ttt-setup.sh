#! /bin/bash


################################
# HYPERLAND CONFIG FILES CURLS #
################################
#pacman -S hyprland hyprpaper hyprlock

echo "installed libs"

mkdir -p /home/ttt/.config/hypr
cd /home/ttt/.config/hypr

echo $(pwd)

curl -o hyprland.conf http://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/hyprland.conf
curl -o hyprlock.conf http://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/hyprlock.conf
curl -o hyprpaper.conf http://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/hyprpaper.conf

