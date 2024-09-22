#!/usr/bin/env bash

. $PACKAGES/zsh.sh
. $PACKAGES/oh-my-zsh.sh
. $PACKAGES/powerlevel10k.sh
. $PACKAGES/nvm.sh

install_packages() {
  install_zsh
  install_ohmyzsh
  install_powerlevel10k
  install_nvm
}
