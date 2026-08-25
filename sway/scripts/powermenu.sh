#!/bin/bash

# Define the options with icons
options="󰌾  Lock\n󰤄  Suspend\n󰍃  Logout\n󰜉  Reboot\n󰒲  Hibernate\n󰐥  Shutdown"

# Pass options to Rofi using your theme, overriding size properties inline at the end
choice=$(echo -e "$options" | rofi -dmenu \
    -p "Power Menu" \
    -i \
    -theme ~/.config/rofi/onedark-theme.rasi \
    -theme-str 'window { width: 14em; } listview { lines: 6; }'
)

# Execute the chosen command
case "$choice" in
    *"Lock") swaylock ;;
    *"Suspend") systemctl suspend ;;
    *"Logout") swaymsg exit ;;
    *"Reboot") systemctl reboot ;;
    *"Hibernate") systemctl hibernate ;;
    *"Shutdown") systemctl poweroff ;;
esac
