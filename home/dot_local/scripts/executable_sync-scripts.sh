#!/usr/bin/env bash

# Make symlinks to the user binary path (default: ~/.local/bin)
# that reference all of the user's scripts in a directory
# (default: ~/.local/scripts)
# This makes running script from your shell easier.

LOCAL_BIN_PATH="$HOME/.local/bin"
SCRIPTS="$HOME/.local/scripts/*.sh"

# Colors
COLOR_NORMAL="\e[0m"
COLOR_LN="\e[$(echo "$LS_COLORS" | grep -Po '(?<=ln=)[0-9|;]*(?=:)')m"
COLOR_EX="\e[$(echo "$LS_COLORS" | grep -Po '(?<=ex=)[0-9|;]*(?=:)')m"

# Arguments
OPTS=$(getopt -o vo -l verbose,overwrite -n "sync-scripts" -- "$@")
eval set -- "$OPTS"

VERBOSE=0   # -v | --verbose
OVERWRITE=0 # -o | --overwrite

while true; do
  case "$1" in
  -v | --verbose)
    VERBOSE=1
    shift
    ;;
  -o | --overwrite)
    OVERWRITE=1
    shift
    ;;
  --)
    shift
    break
    ;;
  esac
done

# Functions
print_msg() {
  local msg="$1"
  if [ $VERBOSE -eq 1 ]; then
    echo -e "$msg"
  fi
}

for script in $SCRIPTS; do
  if [ -f "$script" ] && [ -x "$script" ]; then
    binln="$LOCAL_BIN_PATH/$(basename "$script" .sh)"

    # When the binary link file already exists, overwrite or ignore
    # If it's not, create a new link
    if [ -e "$binln" ]; then
      if [ $OVERWRITE -eq 1 ]; then
        rm "$binln"
        ln -s "$script" "$binln"
        print_msg "Overwrited: $COLOR_LN$binln$COLOR_NORMAL"
      else
        print_msg "Already exists: $COLOR_LN$binln$COLOR_NORMAL"
      fi
    else
      ln -s "$script" "$binln"
      print_msg "Created: $COLOR_LN$binln$COLOR_NORMAL -> $COLOR_EX$script$COLOR_NORMAL"
    fi
  fi
done
