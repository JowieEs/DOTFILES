#!/bin/bash

if pgrep -x "wf-recorder" > /dev/null; then
    killall -s SIGINT wf-recorder
    notify-send "⏺️ Recording Stopped" "Video saved to your Videos folder."
else
    mkdir -p "$HOME/Videos"
    
    GEOMETRY=$(slurp)
    
    if [ -z "$GEOMETRY" ]; then
        exit 0
    fi

    notify-send "🔴 Recording Started" "Press your hotkey again to stop."
    
    FILENAME="$HOME/Videos/recording_$(date +%Y%m%d_%H%M%S).mp4"
    
    wf-recorder -g "$GEOMETRY" -f "$FILENAME" &
fi
