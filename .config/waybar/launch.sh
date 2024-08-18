#/!bin/sh

# quit running waybar instances
killall waybar

#loading new waybar
waybar -c $HOME/.config/waybar/config.jsonc -s $HOME/.config/waybar/style.css