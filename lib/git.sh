#!/bin/sh

set_credential_helper() {
  git_credential_helper='cache'
  if [ "$(uname -s)" = "Darwin" ]; then
    git_credential_helper='osxkeychain'
  fi
  GIT_CONFIG_GLOBAL="$CONFIG/.gitconfig.cred" git config --global credential.helper "$git_credential_helper"
}

set_git_name() {
  [ -z "$git_name" ] && prompt -p git_name "\n\rWhat's your Git author name:"
  GIT_CONFIG_GLOBAL="$CONFIG/.gitconfig.cred" git config --global user.name "$git_name"
}

set_git_email() {
  [ -z "$git_email" ] && prompt -p git_email "\n\rWhat's your Git author email:"
  GIT_CONFIG_GLOBAL="$CONFIG/.gitconfig.cred" git config --global user.email "$git_email"
}

set_git_credentials() {
  [ ! -e "$CONFIG/.gitconfig.cred" ] && touch "$CONFIG/.gitconfig.cred"

  git_name="$(git config --global user.name)"
  git_email="$(git config --global user.email)"

  if [ -z "$git_name" ] || [ -z "$git_email" ]; then
    info 'Setting up git credentials...'
  fi

  set_git_name
  set_git_email
  set_credential_helper

  blankln
}
