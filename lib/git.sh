#!/bin/sh

set_credential_helper() {
  git_credential_helper='cache'
  if [ "$(uname -s)" == "Darwin" ]
  then
    git_credential_helper='osxkeychain'
  fi
  git config --global credential.helper "$git_credential_helper"
}

set_git_name() {
  prompt -p git_name "\n\rWhat's your Git author name:"
  git config --global user.name "$git_name"
}

set_git_email() {
  prompt -p git_email "\n\rWhat's your Git author email:"
  git config --global user.email "$git_email"
}

set_git_credentials() {
  git_name=$(git config --global user.name)
  git_email=$(git config --global user.email)

  if [ -z "$git_name" ] || [ -z "$git_email" ]; then
    info 'Setting up git credentials...'
  fi

  set_credential_helper
  [ -z "$git_name" ] && set_git_name
  [ -z "$git_email" ] && set_git_email

  blankln
}
