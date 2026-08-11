#!/bin/bash
file=~/Pictures/screenshots/screenshot-$(date +%F-%H%M%S).png
grim -g "$(slurp)" "$file" && wl-copy < "$file"
notify-send "Screenshot saved and copied to clipboard" "$file"

