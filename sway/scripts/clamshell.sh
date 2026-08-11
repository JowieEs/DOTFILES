#!/bin/bash

# 1. Get the number of monitors
# We expect a number, e.g., 2
COUNT=$(swaymsg -t get_outputs | jq 'length')

if [ "$1" = "lid_closed" ]; then
  # Only disable internal screen if we have more than 1 monitor
  if [ "$COUNT" -gt 1 ]; then
    swaymsg output eDP-1 disable
  fi
elif [ "$1" = "lid_opened" ]; then
  swaymsg output eDP-1 enable

elif [ "$1" = "init" ]; then
  # Check the physical lid state file
  if grep -q closed /proc/acpi/button/lid/*/state; then
    # Lid is closed: disable eDP-1 if we have an external monitor AND power
    if [ "$COUNT" -gt 1 ]; then
      swaymsg output eDP-1 disable
    fi
  else
    # Lid is physically open
    swaymsg output eDP-1 enable
  fi
fi
