#!/bin/sh

install_nvm() {
  info "Installing nvm..."
  export NVM_DIR="$HOME/.nvm" && (
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR" || exit 1
    git checkout "$(git describe --abbrev=0 --tags --match 'v[0-9]*' "$(git rev-list --tags --max-count=1)")"
  ) && . "$NVM_DIR/nvm.sh"
  info "Finished installing nvm!"
  blankln

  info "Installing node..."
  nvm install --lts
  info "Finished installing node!"
  blankln
}
