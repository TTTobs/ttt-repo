#! /bin/bash


################################
# HYPERLAND CONFIG FILES CURLS #
################################
pacman -S hyprland hyprpaper hyprlock

mkdir -p /home/$USER/.config/hypr
cd /home/$USER/.config/hypr

curl http://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/hyprland.conf > hyprland.conf
curl http://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/hyprlock.conf > hyprlock.conf
curl http://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/hyprpaper.conf > hyprpaper.conf

