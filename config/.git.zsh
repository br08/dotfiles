git() {
  local CONFIG="$DOTFILES/config"
  local config_file=$(mktemp)

  cat "$CONFIG/.gitconfig.cred" "$CONFIG/.gitconfig" > "$config_file"

  if [[ " $@ " == *" user.name "* ]] || [[ " $@ " == *" user.email "* ]] || [[ " $@ " == *" credential.helper "* ]]; then
    config_file="$CONFIG/.gitconfig.cred"
  fi
  GIT_CONFIG_GLOBAL="$config_file" command git "$@"

  [[ "$config_file" != "$CONFIG/.gitconfig.cred" ]] && [[ -f "$config_file" ]] && rm "$config_file"
}
