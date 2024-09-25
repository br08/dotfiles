#!/bin/sh

blankln() {
  echo ''
}

info() {
  printf "\r%s\n" "$1"
}

prompt() {
  option=$1
  output=$2
  text=$3

  printf "\r%s\n> " "$text"

  case "$option" in
    -p ) read -r "$output" < /dev/tty ;;
    -n ) read -r -n 1 "$output" < /dev/tty ;;
    * ) ;;
  esac
}

success() {
  printf "\r\033[2K  [\033[00;32mOK\033[0m] %s\n" "$1"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\nAborting installation...\n" "$1"
  exit 1
}
