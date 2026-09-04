#!/bin/bash
# Update the `borders` app color to reflect AeroSpace state.
#
# Usage: update-borders.sh <default_active_color>
#
# If the focused window is currently fullscreen (via `aerospace fullscreen`),
# the border is forced to yellow so it stays obvious that other windows are
# hidden behind it. Otherwise it falls back to the color for the current
# AeroSpace mode (blue = main, red = window_control), passed in as $1.

fullscreen_color=0xffffff00
default_color="$1"

is_fullscreen=$(aerospace list-windows --focused --format '%{window-is-fullscreen}' 2>/dev/null)

if [ "$is_fullscreen" = "true" ]; then
    borders active_color="$fullscreen_color" inactive_color=0x00000000 width=5.0
else
    borders active_color="$default_color" inactive_color=0x00000000 width=5.0
fi
