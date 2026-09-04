#!/bin/bash
# Update the `borders` app color to reflect AeroSpace state.
#
# Usage: update-borders.sh <default_active_color> <fullscreen_active_color>
#
# If the focused window is currently fullscreen (via `aerospace fullscreen`),
# $2 is used so it stays obvious that other windows are hidden behind it.
# Otherwise it falls back to $1, the color for the current AeroSpace mode
# (blue = main, red = window_control).

default_color="$1"
fullscreen_color="$2"

is_fullscreen=$(aerospace list-windows --focused --format '%{window-is-fullscreen}' 2>/dev/null)

if [ "$is_fullscreen" = "true" ]; then
    borders active_color="$fullscreen_color" inactive_color=0x00000000 width=5.0
else
    borders active_color="$default_color" inactive_color=0x00000000 width=5.0
fi
