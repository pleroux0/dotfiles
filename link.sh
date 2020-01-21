#!/bin/sh

SCRIPT=$(realpath $0)
SCRIPT_DIR=$(dirname "$SCRIPT")

link() {
  ln -si "$SCRIPT_DIR/$1" -T "$2"
}

link shrc.d ~/.shrc.d
link vimrc.d ~/.vimrc.d
