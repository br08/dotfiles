#!/bin/sh

install_dotfiles() {
  info "Installing dotfiles..."

  overwrite_all=false
  backup_all=false
  skip_all=false

  for src in $(find "$CONFIG" -maxdepth 1 -type f -not -name 'install.sh'); do
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"
  done

  blankln
}
