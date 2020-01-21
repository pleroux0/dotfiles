#!/bin/sh

SCRIPT_DIR=$(dirname "$0")

link() {
  ln -si "$SCRIPT_DIR/$1" "$2"
}

link shrc.d ~/.shrc.d
link vimrc.d ~/.vimrc.d
