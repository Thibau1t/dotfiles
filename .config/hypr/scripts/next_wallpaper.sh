#!/bin/bash

# Define the directory containing your background images
directory="$HOME/.config/wallpapers"

# File to keep track of the current index
index_file="$HOME/.cache/wallpaper/current_wallpaper_index"

# File to store the current wallpaper
current_wallpaper_file="$HOME/.cache/wallpaper/current_wallpaper.png"

# Get the monitor name using hyprctl
monitor=$(hyprctl monitors | grep Monitor | awk '{print $2}')

# Ensure the directory exists
if [ ! -d "$directory" ]; then
    exit 1
fi

# List images and store them in an array
wallpaper_list=($(ls "$directory"/*.png 2>/dev/null))

# Create index file with initial value 1 if it doesn't exist
if [ ! -f "$index_file" ]; then
    echo 1 > "$index_file"
fi

# Read the current index
current_index=$(cat "$index_file")

# Get the total number of images
num_images=${#wallpaper_list[@]}

# Ensure index is within range
if [ "$current_index" -ge "$num_images" ] || [ "$current_index" -lt 0 ]; then
    current_index=0
fi

# Determine the next index
next_index=$(( (current_index + 1) % num_images ))

# Get the next wallpaper
next_wallpaper="${wallpaper_list[$next_index]}"

if [ -n "$next_wallpaper" ]; then
    # Ensure hyprpaper is ready
    hyprctl hyprpaper unload all

    # Preload and apply the selected background
    hyprctl hyprpaper preload "$next_wallpaper"
    hyprctl hyprpaper wallpaper "$monitor,$next_wallpaper"

    # Update the index file with the next index
    echo $next_index > "$index_file"

    # Copy the current wallpaper to the designated file
    cp "$next_wallpaper" "$current_wallpaper_file"
fi
