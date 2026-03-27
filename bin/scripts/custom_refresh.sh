#!/usr/bin/env bash

STATE_FILE="$HOME/.local/state/refresh_mode"
MONITOR="eDP-1"

# Read current mode
if [ ! -f "$STATE_FILE" ]; then
    echo "0" > "$STATE_FILE"
fi
MODE=$(cat "$STATE_FILE")

# Toggle mode
if [ "$MODE" = "0" ]; then
    RATE=144
    echo "1" > "$STATE_FILE"
else
    RATE=60
    echo "0" > "$STATE_FILE"
fi

# Apply refresh rate
hyprctl keyword "monitor $MONITOR,1920x1080@${RATE},0x0,1"

# Notify
notify-send "Refresh rate: ${RATE}Hz"
