#!/bin/sh

set_git_name() {
  prompt -p gitname "\n\rWhat's your Git author name:"
  git config --global user.name "$gitname"
}

set_git_email() {
  prompt -p gitemail "\n\rWhat's your Git author email:"
  git config --global user.email "$gitemail"
}

set_git_credentials() {
  gitname=$(git config --global user.name)
  gitemail=$(git config --global user.email)

  if [ -z "$gitname" ] || [ -z "$gitemail" ]; then
    info 'Setting up git credentials...'
  fi
  
  [ -z "$gitname" ] && set_git_name
  [ -z "$gitemail" ] && set_git_email

  blankln
}
