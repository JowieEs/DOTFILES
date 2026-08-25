#!/bin/sh

COUNT=$(swaymsg -t get_outputs | jq 'length')

if [ "$COUNT" -eq 1 ]; then 
    swaymsg output eDP-1 enable
    swaylock 
fi
