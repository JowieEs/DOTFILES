#!/bin/sh

# 1. Check if Charging (AC Online)
AC_PATH="/sys/class/power_supply/AC/online"
IS_CHARGING="0"
if [ -f "$AC_PATH" ] && [ "$(cat "$AC_PATH")" = "1" ]; then
    IS_CHARGING="1"
fi

# 2. Check for External Monitors (Count connected outputs)
SCREEN_COUNT=$(swaymsg -t get_outputs | jq 'length')

# --- LOGIC ---
if [[ "$IS_CHARGING" = "1"  &&  "$SCREEN_COUNT" -gt 1 ]]; then
    # Do nothing (Exit). We are docked.
    exit 0
else
    systemctl suspend-then-hibernate
fi
