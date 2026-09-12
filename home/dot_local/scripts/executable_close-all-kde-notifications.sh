#!/bin/sh

# Close all of the notifications from KDE Plasma desktop environment.
# You can add global shortcut from System Settings.
# e.g. Add script shortcut that executes "sh /path/to/close-all-kde-notifications.sh"

# Argument
OPTS=$(getopt -o s -l silent -n "close-all-kde-notifications" -- "$@")
eval set -- "$OPTS"

SILENT=0 # -s | --silent

while true; do
  case "$1" in
  -s | --silent)
    SILENT=1
    shift
    ;;
  --)
    shift
    break
    ;;
  esac
done

for i in $(seq "$(notify-send -p " " -t 1)" -1 0); do
  qdbus6 org.kde.plasmashell \
    /org/freedesktop/Notifications \
    org.freedesktop.Notifications.CloseNotification "$i"
done

if [ $SILENT -ne 1 ]; then
  notify-send -a "close-all-kde-notification.sh" -p "All notifications are closed!" -t 2000
fi
