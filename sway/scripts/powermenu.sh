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
    *"Lock") swaylock \
      --screenshots \
      --clock \
      --text-color ffffff \
      --indicator \
      --indicator-radius 100 \
      --indicator-thickness 7 \
      --effect-blur 7x5 \
      --effect-vignette 0.5:0.5 \
      --ring-color e60012 \
      --key-hl-color e60012 \
      --line-color 00000000 \
      --inside-color 00000088 \
      --separator-color 00000000 \
      --fade-in 0.2 \
      --daemonize;;
    *"Suspend") systemctl suspend ;;
    *"Logout") swaymsg exit ;;
    *"Reboot") systemctl reboot ;;
    *"Hibernate") systemctl hibernate ;;
    *"Shutdown") systemctl poweroff ;;
esac
