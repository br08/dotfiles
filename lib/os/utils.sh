#!/bin/sh

probe_os() {
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    OSID="$ID"
    OSNAME="$NAME"
  fi
}

source_os_cmds() {
  if [ -n "$OSID" ]; then
    info "Operating system identified as $OSNAME."
    info "Setting installation commands accordingly..."
    . "$OS/$OSID"
  else
    fail "Cannot determine the operating system."
  fi
  blankln
}
