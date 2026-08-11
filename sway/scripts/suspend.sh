#!/bin/bash

# 1. Check if Charging (AC Online)
AC_PATH="/sys/class/power_supply/AC/online"
# Some systems use BAT0, BAT1, or ACAD. Verify your path if this fails.
IS_CHARGING="0"
if [ -f "$AC_PATH" ] && [ "$(cat "$AC_PATH")" = "1" ]; then
    IS_CHARGING="1"
fi

# 2. Check for External Monitors (Count connected outputs)
# We count how many lines swaymsg outputs for connected screens. 
# If it's more than 1 (the internal screen), we assume docked.
SCREEN_COUNT=$(swaymsg -t get_outputs | grep "name" | wc -l)

# --- LOGIC ---
# If Charging AND more than 1 screen connected...
if [[ "$IS_CHARGING" == "1"  &&  "$SCREEN_COUNT" -gt 1 ]]; then
    exit 0
else
    # We are on single screen AC or BAT or SCREEN . Suspend.
    systemctl suspend-then-hibernate
fi
