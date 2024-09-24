#!/usr/bin/env bash

. $LIB/link.sh

set_git_credentials() {
  local gitname=
  local gitemail=

  printf "\n\rSet your Git name:"
  read -p " " gitname < /dev/tty
  git config --global user.name "$gitname"

  printf "\n\rSet your Git email:"
  read -p " " gitemail < /dev/tty
  git config --global user.email "$gitemail"
}

install_dotfiles() {
  info "Installing dotfiles..."

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find "$CONFIG" -maxdepth 1 -type f -not -name 'install.sh')
  do
    dst="$HOME/$(basename $src)"
    link_file "$src" "$dst"
  done

  blankln
}
