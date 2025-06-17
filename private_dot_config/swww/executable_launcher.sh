#!/bin/bash

# Start swww daemon if not running
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon > /dev/null 2>&1 &
    sleep 1
fi

# First wallpaper immediately
wallpapers_dir="$HOME/.config/swww/wallpapers"
files=("$wallpapers_dir"/*)

if [ ${#files[@]} -eq 0 ]; then
    echo "No wallpapers found in $wallpapers_dir"
    exit 1
fi

# Set a random wallpaper immediately
swww img "${files[RANDOM % ${#files[@]}]}"

# Then loop forever, changing every minute
while true; do
    sleep 60
    files=("$wallpapers_dir"/*)
    swww img "${files[RANDOM % ${#files[@]}]}"
done
