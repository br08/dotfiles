#!/usr/bin/env bash

probe_os() {
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    OSID="$ID"
    OSNAME="$NAME"
  fi
}

source_os_cmds() {
  if [ -n $OSID ]; then
    info "\nThe operating system was identified as $OSNAME.\n"
    . $OS/$OSID
  else
    fail "Cannot determine the operating system."
  fi
}
