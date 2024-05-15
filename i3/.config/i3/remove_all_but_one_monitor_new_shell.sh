#!/bin/bash

# Use your preferred terminal emulator, e.g., gnome-terminal, xterm, etc.
terminal_emulator="xterm" # or replace with gnome-terminal, alacritty, etc.

# Run the monitor management commands within the terminal
# connected_monitors=\$(xrandr --listmonitors | grep -oP \"(?<=\\s)[\\w-]+(?=\\s\\()\"); \
#   (\w+[-\d*]+)
# "\\s\\s\\(\\w+[-\\d*]+\\)"
$terminal_emulator -e "bash -c '\
echo \"Resetting monitors...\"; \
xrandr --auto; \
echo \"Enter the monitor you want to keep on (e.g., HDMI-1):\"; \
read main_monitor; \
connected_monitors=\$(xrandr --listmonitors | grep -oP \"\\s\\s(\\w+[\-\\d*]+)\"); \
echo \$connected_monitors; \
if ! grep -qw \"\$main_monitor\" <<< \"\$connected_monitors\"; then \
    echo \"Unknown monitor: \$main_monitor\"; \
    read -p \"Press enter to exit...\"; \
    exit 1; \
fi; \
for monitor in \$connected_monitors; do \
    if [ \"\$monitor\" = \"\$main_monitor\" ]; then \
        xrandr --output \"\$monitor\" --auto; \
    else \
        xrandr --output \"\$monitor\" --off; \
    fi; \
done; \
echo \"Display configuration updated. Only \$main_monitor is on.\"; \
read -p \"Press enter to exit...\"'"


