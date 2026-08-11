#!/bin/sh

SINK="@DEFAULT_SINK@"

get_volume() {
    pactl get-sink-volume "$SINK" | grep -o "[0-9]\+%" | head -1 | tr -d '%'
}

case "$1" in
    up)
        current=$(get_volume)
        if [ "$current" -lt 100 ]; then
            pactl set-sink-volume "$SINK" +5%
            new=$(get_volume)
            if [ "$new" -gt 100 ]; then
                pactl set-sink-volume "$SINK" 100%
            fi
        fi
        notify
        ;;
    down)
        current=$(get_volume)
        if [ "$current" -gt 0 ]; then
            pactl set-sink-volume "$SINK" -5%
            new=$(get_volume)
            if [ "$new" -lt 0 ]; then
                pactl set-sink-volume "$SINK" 0%
            fi
        fi
        notify
        ;;
    mute)
        pactl set-sink-mute "$SINK" toggle
        notify
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac

