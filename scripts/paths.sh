#!/bin/sh

cd "$(dirname "$0")/.." || exit 1
ROOT=$(pwd -P)
LIB="$ROOT/lib"
OS="$LIB/os"
PACKAGES="$ROOT/packages"
CONFIG="$ROOT/config"
