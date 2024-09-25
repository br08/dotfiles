#!/bin/sh

install_zsh() {
  fakezshrc=false
  info "Installing zsh..."
  $INSTALL zsh
  [ ! -f "$HOME/.zshrc" ] && touch "$HOME/.zshrc" && fakezshrc=true # fix oh-my-zsh trying to create a default .zshrc file
  info "Setting zsh as the default shell."
  sudo sed -i "/^$(whoami):/s|[^:]*$|/bin/zsh|" /etc/passwd
  info "Finished installing zsh."
  blankln

  info "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
  [ "$fakezshrc" = "true" ] && rm "$HOME/.zshrc"
  info "Finished installing Oh My Zsh!"
  blankln

  ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
  info "Installing powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
  info "Finished installing powerlevel10k!"
  blankln
}
