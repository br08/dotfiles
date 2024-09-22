#!/usr/bin/env bash

install_powerlevel10k() {
  local ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
  info "Installing powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
  info "Finished installing powerlevel10k!"
  blankln
}
