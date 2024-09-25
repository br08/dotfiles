#!/bin/sh

link_file() {
  src=$1
  dst=$2

  overwrite=
  backup=
  skip=
  action=

  if [ -f "$dst" ] || [ -d "$dst" ] || [ -L "$dst" ]; then
    if [ "$overwrite_all" = "false" ] && [ "$backup_all" = "false" ] && [ "$skip_all" = "false" ]; then
      currentSrc=$(ls -l "$dst" | awk '{print $NF}')

      if [ "$currentSrc" = "$src" ]; then
        skip=true
      else
        prompt -n action "\nFile already exists: $dst, what do you want to do?\n
        \r s)kip,
        \r S)kip all,
        \r o)verwrite,
        \r O)verwrite all,
        \r b)ackup,
        \r B)ackup all\n"

        case "$action" in
          o ) overwrite=true ;;
          O ) overwrite_all=true ;;
          b ) backup=true ;;
          B ) backup_all=true ;;
          s ) skip=true ;;
          S ) skip_all=true ;;
          * ) ;;
        esac
      fi
    fi
    
    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" = "true" ]; then
      rm -rf "$dst"
      success "Removed $dst"
    fi

    if [ "$backup" = "true" ]; then
      mv "$dst" "${dst}.backup"
      success "Renamed $dst to ${dst}.backup"
    fi

    if [ "$skip" = "true" ]; then
      success "Skipped $dst"
    fi
  fi

  if [ "$skip" != "true" ]; then
    ln -s "$src" "$dst"
    success "Linked $dst to $src"
  fi
}
