#!/bin/bash

current=$(busctl get-property net.hadess.PowerProfiles /net/hadess/PowerProfiles net.hadess.PowerProfiles ActiveProfile | awk '{print $2}' | tr -d '"')

if [ "$current" == "power-saver" ]; then
    next="balanced"
elif [ "$current" == "balanced" ]; then
    next="performance"
else
    next="power-saver"
fi

busctl set-property net.hadess.PowerProfiles /net/hadess/PowerProfiles net.hadess.PowerProfiles ActiveProfile s "$next"

# Display desktop notification (matching volume/brightness OSD style)
if command -v notify-send >/dev/null; then
    notify-send \
        --app-name sway \
        --expire-time 800 \
        --hint string:x-canonical-private-synchronous:power-profile \
        --transient \
        "Power Profile: ${next}"
fi
