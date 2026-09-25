#!/bin/bash

# Find the battery directory dynamically (usually BAT0 or BAT1)
BAT_DIR=$(ls -d /sys/class/power_supply/BAT* | head -n 1)

# Read the current end threshold
current=$(cat "$BAT_DIR/charge_control_end_threshold")

if [ "$current" -ge 90 ]; then
    # Currently in Travel mode -> Switch to Home mode
    mode="Home"
    start=70
    end=80
    
    # CRITICAL: When lowering limits, you must lower the START threshold first
    # Otherwise the kernel rejects it because start cannot be greater than end.
    echo "$start" | sudo tee "$BAT_DIR/charge_control_start_threshold" > /dev/null
    echo "$end" | sudo tee "$BAT_DIR/charge_control_end_threshold" > /dev/null
else
    # Currently in Home mode -> Switch to Travel mode
    mode="Travel"
    start=99
    end=100
    
    # CRITICAL: When raising limits, you must raise the END threshold first
    echo "$end" | sudo tee "$BAT_DIR/charge_control_end_threshold" > /dev/null
    echo "$start" | sudo tee "$BAT_DIR/charge_control_start_threshold" > /dev/null
fi

# Display desktop notification (matching your OSD style)
if command -v notify-send >/dev/null; then
    notify-send \
        --app-name sway \
        --expire-time 800 \
        --hint string:x-canonical-private-synchronous:battery-threshold \
        --transient \
        "Battery: ${mode} (${end}%)"
fi
