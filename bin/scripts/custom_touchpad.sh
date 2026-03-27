#!/usr/bin/env bash

STATE_FILE="$HOME/.local/state/touchpad_toggle"
DEVICE="elan0307:00-04f3:3282-touchpad"

# Create state file if missing
if [ ! -f "$STATE_FILE" ]; then
    echo "true" > "$STATE_FILE"
fi

CURRENT=$(cat "$STATE_FILE")

if [ "$CURRENT" = "true" ]; then
    hyprctl keyword "device[$DEVICE]:enabled=false"
    echo "false" > "$STATE_FILE"
    notify-send "Touchpad Disabled"
else
    hyprctl keyword "device[$DEVICE]:enabled=true"
    echo "true" > "$STATE_FILE"
    notify-send "Touchpad Enabled"
fi
