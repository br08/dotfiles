#!/usr/bin/env bash

link_file() {
  local src=$1 dst=$2

  local overwrite= backup= skip= action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then
    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then
      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]; then
        skip=true;
      else
        prompt -n action "
        \rFile already exists: $dst, what do you want to do?
        
        \r s)kip,
        \r S)kip all,
        \r o)verwrite,
        \r O)verwrite all,
        \r b)ackup,
        \r B)ackup all"

        case "$action" in
          o ) overwrite=true;;
          O ) overwrite_all=true;;
          b ) backup=true;;
          B ) backup_all=true;;
          s ) skip=true;;
          S ) skip_all=true;;
          * ) ;;
        esac
      fi
    fi
    
    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]; then
      rm -rf "$dst"
      success "Removed $dst"
    fi

    if [ "$backup" == "true" ]; then
      mv "$dst" "${dst}.backup"
      success "Renamed $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]; then
      success "Skipped $dst"
    fi
  fi

  if [ "$skip" != "true" ]; then
    ln -s "$src" "$dst"
    success "Linked $dst to $src"
  fi
}
