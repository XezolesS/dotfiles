CONFIG_FASTFETCH="$XDG_CONFIG_HOME/fastfetch"

__fastfetch_auto_config() {
  if [ -n "$TMUX" ]; then
    # In tmux session
    fastfetch --config "$CONFIG_FASTFETCH/config-simple.jsonc"
  elif [ -n "$KONSOLE_VERSION" ]; then
    # In Konsole
    fastfetch --config "$CONFIG_FASTFETCH/config-simple.jsonc"
  else
    # Default
    fastfetch
  fi
}

alias fastfetch=__fastfetch_auto_config
