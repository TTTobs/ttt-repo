#! /bin/bash

#Hyprland setup file very great trust bro.

##########################################
#           BUILD FOLDER STRUCTURE       #
##########################################

mkdir -p /home/$USER/.config/waybar

pacman -S hyprland hyprpaper hyprlock waybar

curl -L https://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/ttt-hypr.sh | sudo bash
curl -L https://raw.githubusercontent.com/TTTobs/ttt-repo/refs/heads/main/ttt-waybar.sh | sudo bash

