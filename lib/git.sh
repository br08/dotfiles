#!/usr/bin/env bash

set_git_name() {
  local -n authorname=$1
  prompt -p gitname "\n\rWhat's your Git author name:"
  git config --global user.name "$authorname"
}

set_git_email() {
  local -n authoremail=$1
  prompt -p gitemail "\n\rWhat's your Git author email:"
  git config --global user.email "$authoremail"
}

set_git_credentials() {
  local gitname=$(git config --global user.name)
  local gitemail=$(git config --global user.email)

  [ -z "$gitname" -o -z "$gitemail" ] && info 'Setting up git credentials...'
  [ -z "$gitname" ] && set_git_name gitname
  [ -z "$gitemail" ] && set_git_email gitemail

  blankln
}