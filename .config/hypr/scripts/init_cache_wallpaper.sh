#!/bin/bash

cache_directory="$HOME/.cache/wallpaper"

index_file="$cache_directory/current_wallpaper_index"
current_wallpaper_file="$cache_directory/current_wallpaper.png"

base_image="$HOME/.config/wallpapers/mountains.png"

# Create the cache directory if it doesn't exist
if [ ! -d "$cache_directory" ]; then
    mkdir -p "$cache_directory"
fi

# Copy the base image to the current wallpaper file
cp "$base_image" "$current_wallpaper_file"

# Create the index file with the correct index if it doesn't exist
echo 1 > "$index_file"