#!/bin/bash

picom &

# locks screen after lid close or after 10 minutes of idletime.
# If a video is playing the lock won't happen. If spotify is running in the background
# it will lock the screen.
xset s 600
xss-lock --transfer-sleep-lock -- dm-tool switch-to-greeter & sleep 1

# Set Background
feh --bg-scale .config/qtile/wallpapers/winter-lake.jpg

# Autostart Nextcloud
nextcloud --background &

# Start InSync
insync start

# Activate Numlock
numlockx

# Mute if only one output (builtin-speakers)
inputCount=$(pulsemixer --list-sources | wc -l)
if ((inputCount <= 1));#["$inputCount" -le 1]
then
  pulsemixer --mute
else
  pulsemixer --unmute
fi
