#!/bin/bash
# Update the `borders` app color to reflect AeroSpace's current state.
#
# Usage: update-borders.sh
#
# Both the current binding mode and the fullscreen state of the focused
# window are queried live from AeroSpace, so any keybinding that might
# change either one can just call this script with no arguments and the
# color always reflects reality.

mode=$(aerospace list-modes --current 2>/dev/null)
fullscreen=$(aerospace list-windows --focused --format '%{window-is-fullscreen}' 2>/dev/null)

if [ "$fullscreen" = "true" ]; then
    color=0xffffff00   # yellow — fullscreen, other windows are hidden behind it
elif [ "$mode" = "window_control" ]; then
    color=0xffff1111   # red — window_control mode
else
    color=0xff1122ff   # blue — main mode
fi

borders active_color="$color" inactive_color=0x00000000 width=5.0
