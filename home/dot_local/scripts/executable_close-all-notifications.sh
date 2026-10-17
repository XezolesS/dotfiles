#! /usr/bin/env sh

# Close all of the notifications using org.freedesktop.Notifications dbus interface.
# You can find more info in:
# https://specifications.freedesktop.org/notification/latest-single/
#
# If you're on KDE Plasma, you can add global shortcut from System Settings.
# e.g. Add script shortcut that executes "/path/to/close-all-notifications.sh"

# Argument
OPTS=$(getopt -o s -l silent -n "close-all-notifications" -- "$@")
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

R_TITLE="${1:-"Close All Notifications"}"
R_DESC="${2:-"All notifications are closed!"}"

for i in $(seq "$(notify-send -p " " -t 1)" -1 0); do
  dbus-send --session --dest=org.freedesktop.Notifications \
    /org/freedesktop/Notifications \
    org.freedesktop.Notifications.CloseNotification "uint32:$i"
done

if [ $SILENT -ne 1 ]; then
  notify-send -a "$R_TITLE" -p "$R_DESC" -t 2000
fi
