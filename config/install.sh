#!/usr/bin/env bash

install_dotfiles() {
  info "Installing dotfiles..."
  for src in $(find "$CONFIG" -maxdepth 1 -type f -not -name 'install.sh')
  do
    cp $src ~/
  done
  blankln
}