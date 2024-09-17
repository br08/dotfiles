#!/usr/bin/env bash

install_ohmyzsh() {
  info "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
  info "Finished installing Oh My Zsh!"
  blankln
}
