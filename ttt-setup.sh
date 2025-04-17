#! /bin/bash


################################
# HYPERLAND CONFIG FILES CURLS #
################################
pacman -S hyprland hyprpaper hyprlock

echo "installed libs"

#mkdir -p /home/ttt/.config/hypr
#cd /home/ttt/.config/hypr

echo $(pwd)

curl http://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/hyprland.conf > hyprland.conf
curl http://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/hyprlock.conf > hyprlock.conf
curl http://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/hyprpaper.conf > hyprpaper.conf

