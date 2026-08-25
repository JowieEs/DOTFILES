#!/bin/bash

mkdir -p ~/Pictures/screenshots

file=~/Pictures/screenshots/screenshot-$(date +%F-%H%M%S).png

grim -g "$(slurp)" - | tee "$file" | wl-copy --type image/png

notify-send "Screenshot saved and copied to clipboard" "$file"
