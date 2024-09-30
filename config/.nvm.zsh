export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm_use() {
  node_default() {
    nvm alias default | awk '{print $NF}' | tr -d ')' | sed 's/\x1b\[[0-9;]*m//g'
  }

  if [[ -e .nvmrc ]]; then
    nvm install
  else
    if [[ ! "$(node_default)" =~ "^v" ]]; then
      nvm install --lts
    fi

    local current=$(node -v 2> /dev/null)
    if [[ "$current" != "$(node_default)" ]]; then
      nvm use default
    fi
  fi
}
