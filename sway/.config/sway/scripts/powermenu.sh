#!/bin/bash

# Define the options
options="  Lock\n󰤄  Suspend\n󰍃  Logout\n󰜉  Reboot\n󰒲  Hibernate\n󰐥  Shutdown"

# Pipe them into fzf
choice=$(echo -e "$options" | fzf \
    --prompt="⏻ Power Menu: " \
    --layout=reverse \
    --info=hidden \
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
