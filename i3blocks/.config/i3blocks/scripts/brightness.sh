#!/bin/bash

# Get the current brightness level
BRIGHTNESS=$(light -G | cut -d '.' -f1)  # Get brightness as an integer

case $BLOCK_BUTTON in
    5) light -A 5 ;;  # Scroll up to increase brightness by 5%
    4) light -U 5 ;;  # Scroll down to decrease brightness by 5%
    1) xfce4-power-manager-settings & ;;  # Left-click to open settings
esac

# Output brightness percentage
echo "$BRIGHTNESS%"
