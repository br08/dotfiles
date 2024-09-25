#!/bin/sh

. "$PACKAGES/zsh.sh"
. "$PACKAGES/nvm.sh"

install_packages() {
  install_zsh
  install_nvm
}
