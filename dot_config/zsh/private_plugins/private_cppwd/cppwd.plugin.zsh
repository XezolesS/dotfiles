# cppwd
# Copy present working directory to the clipboard.
function cppwd() {
  local current_dir=$( { pwd | tr -d '\n' ; } )
  local msg_copied="Copied to clipboard: $current_dir"
  local msg_failed="Failed to copy pwd to clipboard:"

  # Wayland (wl-clipboard)
  if [ $XDG_SESSION_TYPE = "wayland" ]; then
    if command -v wl-copy 1> /dev/null; then
      wl-copy -- $current_dir 2> /dev/null
      echo $msg_copied
      return 0
    else
      echo "$msg_failed Cannot find 'wl-clipboard' utility."
      return 1
    fi
  elif [ $XDG_SESSION_TYPE = "x11" ]; then
    if command -v xclip 1> /dev/null; then
      echo $current_dir | xclip -selection clipboard
      echo $msg_copied
      return 0
    else
      echo "$msg_failed Cannot find 'xclip' utility."
      return 1
    fi
  else
    echo "$msg_failed Session not supported."
    return 1
  fi
}
