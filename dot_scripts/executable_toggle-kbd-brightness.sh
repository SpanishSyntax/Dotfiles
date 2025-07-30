#!/bin/bash

DEVICE="tpacpi::kbd_backlight"
CURRENT=$(brightnessctl --device="$DEVICE" get)
NEXT=$(( (CURRENT + 1) % 3 ))

brightnessctl --device="$DEVICE" set "$NEXT"

# Optional: notify (requires notify-send + a daemon like dunst or mako)
if command -v notify-send &> /dev/null; then
    notify-send "Keyboard Brightness" "Level set to $NEXT"
fi
