export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm_use() {
  [[ -z "$NODE_DEFAULT" ]] && (
    nvm install --lts
    export NODE_DEFAULT=$(nvm alias default | awk '{print $NF}' | tr -d ')' | sed 's/\x1b\[[0-9;]*m//g')
  )

  if [[ -e .nvmrc ]]; then
    nvm install
  else
    local current=$(node -v)
    if [[ $current != $NODE_DEFAULT ]]; then
      nvm use default
    fi
  fi
}
