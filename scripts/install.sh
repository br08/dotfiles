#!/bin/sh

set -e

. "$(dirname "$0")/paths.sh"
. "$LIB/helpers.sh"
. "$LIB/git.sh"
. "$OS/utils.sh"
. "$PACKAGES/install.sh"
. "$CONFIG/install.sh"

blankln
info "Initiating setup..."

probe_os
source_os_cmds
install_packages
install_dotfiles
set_git_credentials

info "Setup complete!"
blankln
