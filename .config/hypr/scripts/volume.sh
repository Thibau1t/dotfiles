#!/bin/bash

# obtain the output device id
SINK=$(pactl info | grep 'Default Sink' | awk '{print $3}')

# Obtenez le volume actuel du périphérique de sortie
current_volume=$(pactl get-sink-volume "$SINK" | awk '{print $5}' | sed 's/%//')

# check if the volume is already at 100%
if [ "$current_volume" -ge 100 ]; then
  exit 0
fi

# calculate the new volume
new_volume=$((current_volume + 1))

# check if the volume does not exceed 100%
if [ "$new_volume" -gt 100 ]; then
  new_volume=100
fi

# apply the new volume
pactl set-sink-volume "$SINK" ${new_volume}%
