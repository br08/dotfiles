#!/usr/bin/env bash

probe_os() {
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    OSID="$ID"
    OSNAME="$NAME"
  fi
}

source_os_cmds() {
  . $OS/$OSID
}
