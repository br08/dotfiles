#!/usr/bin/env bash

blankln() {
  echo ''
}

info() {
  printf "\r$1\n"
}

prompt() {
  local option=$1 text=$3
  local -n output=$2

  printf "\r$text\n> "

  case "$option" in
    -p ) read -p " " output < /dev/tty;;
    -n ) read -n 1 output < /dev/tty;;
    * ) ;;
  esac
}

success() {
  printf "\r\033[2K  [\033[00;32mOK\033[0m] $1\n"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\nAborting installation..."
  echo ''
  exit 1
}
