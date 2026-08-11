#!/bin/bash

# Check if wf-recorder is already running
if pgrep -x "wf-recorder" > /dev/null
then
    # If running, stop it gracefully
    killall -s SIGINT wf-recorder
    notify-send "⏺️ Recording Stopped" "Video saved to your Videos folder."
else
    # If not running, prompt for a region and start recording
    notify-send "🎥 Select Region" "Drag your mouse to record a section."
    
    # Creates a unique filename based on the date and time
    FILENAME=~/Videos/recording_$(date +%Y%m%d_%H%M%S).mp4
    
    # Use slurp to get the region, then pass it to wf-recorder
    wf-recorder -g "$(slurp)" -f "$FILENAME" &
    
    # Brief pause to ensure it started, then send a notification
    sleep 0.5
    notify-send "🔴 Recording Started" "Press your hotkey again to stop."
fi
