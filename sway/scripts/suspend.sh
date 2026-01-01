
#!/bin/sh

AC_PATH="/sys/class/power_supply/AC/online"

# Only suspend when running on battery
if [ -f "$AC_PATH" ] && [ "$(cat "$AC_PATH")" = "0" ]; then
    systemctl suspend-then-hibernate
fi
