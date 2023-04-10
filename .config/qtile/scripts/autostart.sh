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

if [ -z "$SSH_AUTH_SOCK" ]; then
    # Check for a currently running instance of the agent
    RUNNING_AGENT="$(ps -ax | grep 'ssh-agent' | grep -v grep | wc -l | tr -d '[:space:]')"

    if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent and set environment variables
        eval "$(ssh-agent -s)"
    fi
else
    echo "SSH Agent is already running."
fi

# Check if the key is already added to the agent
if ! ssh-add -l | grep -q "id_rsa"; then
    # Add the key to the agent
    ssh-add ~/.ssh/id_rsa
else
    echo "Key is already added to the agent."
fi
