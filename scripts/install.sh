#!/usr/bin/env bash

set -e

. $(dirname "$0")/paths.sh
. $LIB/helpers.sh
. $OS/utils.sh

blankln
info "Initiating setup..."

probe_os
if [ -n $OSID ]; then
  source_os_cmds
  info "\n$OSNAME operating system identified.\n"
else
  fail "Cannot determine the operating system."
fi

info "Setup complete!"
blankln
