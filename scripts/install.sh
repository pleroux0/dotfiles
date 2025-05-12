#!/bin/sh 

REPOSITORY=$(dirname "$0")/..
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/"

INSTALL=(
  "nvim"
)

cp -r "$REPOSITORY/${INSTALL[@]}" "$CONFIG"
