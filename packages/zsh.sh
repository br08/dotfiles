#!/usr/bin/env bash

install_zsh() {
  info "Installing zsh..."
  $INSTALL zsh
  [ ! -f ~/.zshrc ] && touch ~/.zshrc
  info "Setting zsh as the default shell."
  sudo sed -i "/^$(whoami):/s|[^:]*$|/bin/zsh|" /etc/passwd
  info "Finished installing zsh."
  blankln
}
