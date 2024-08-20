#!/bin/bash

# obtain the output device id
SINK=$(pactl info | grep 'Default Sink' | awk '{print $3}')

# obtain the current volume
current_volume=$(pactl get-sink-volume "$SINK" | awk '{print $5}' | sed 's/%//')

# check if the volume is already at 120%
if [ "$current_volume" -ge 120 ]; then
  exit 0
fi

# calculate the new volume
new_volume=$((current_volume + 1))

# check if the volume does not exceed 120%
if [ "$new_volume" -gt 120 ]; then
  new_volume=120
fi

# apply the new volume
pactl set-sink-volume "$SINK" ${new_volume}%