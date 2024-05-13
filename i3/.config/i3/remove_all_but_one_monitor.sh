#!/bin/bash

# Prompt user for the monitor to keep on
read -p "Enter the monitor you want to keep on (e.g., HDMI-1): " main_monitor

# Get the list of currently connected monitors
connected_monitors=$(xrandr --list-monitors | grep -oP '(?<=\s)[\w-]+(?=\s\()' )
echo connected_monitors

# Check if the input monitor is in the list of connected monitors
if ! grep -qw "$main_monitor" <<< "$connected_monitors"; then
    echo "Unknown monitor: $main_monitor"
    exit 1
fi

# Turn off all monitors except the one specified
for monitor in $connected_monitors; do
    if [ "$monitor" = "$main_monitor" ]; then
        xrandr --output "$monitor" --auto
    else
        xrandr --output "$monitor" --off
    fi
done

echo "Display configuration updated. Only $main_monitor is on."
