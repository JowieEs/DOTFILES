#!/bin/sh

AC_PATH="/sys/class/power_supply/AC/online"

# Only lock when running on battery
if [ -f "$AC_PATH" ] && [ "$(cat "$AC_PATH")" = "0" ]; then
    
    swaymsg output eDP-1 enable

    swaylock \
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
      --grace 2 \
      --fade-in 0.2 \
      --daemonize
fi

