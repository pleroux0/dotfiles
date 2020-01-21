#!/bin/sh

SCRIPT=$(realpath $0)
SCRIPT_DIR=$(dirname "$SCRIPT")

PYENV_ROOT=${PYENV_ROOT:-$HOME/.pyenv}
PYENV_USER=${PYENV_USER:-$(whoami)}
PYENV_GIT=${PYENV_GIT:-https://github.com/pyenv/pyenv.git}
PYENV_VIRTUALENV_GIT=${PYENV_VIRTUALENV_GIT:-https://github.com/pyenv/pyenv-virtualenv.git}

# Create directory
mkdir -p "$PYENV_ROOT"

# Update/Install pyenv
if [ ! -e "$PYENV_ROOT/.git" ]; then
  git clone "$PYENV_GIT" "$PYENV_ROOT"
else
  (cd "$PYENV_ROOT" && git fetch --all --prune)
fi

# Update/Install pyenv-virtualenv
if [ ! -e "$PYENV_ROOT/plugins/pyenv-virtualenv/.git" ]; then
  git clone "$PYENV_VIRTUALENV_GIT" "$PYENV_ROOT/plugins/pyenv-virtualenv"
else
  (cd "$PYENV_ROOT/plugins/pyenv-virtualenv" && git fetch --all --prune)
fi

# Create initialization script
PYENV_INIT_SCRIPT=$SCRIPT_DIR/../shrc.d/pyenv.sh
echo 'if [ -n "$PYENV_ENABLED" ]; then return 0; fi' > $PYENV_INIT_SCRIPT
echo "export PYENV_ENABLED=1" >> $PYENV_INIT_SCRIPT
echo "export PATH=$PYENV_ROOT/bin:\$PATH" >> $PYENV_INIT_SCRIPT
echo 'eval "$(pyenv init -)"' >> $PYENV_INIT_SCRIPT
echo 'eval "$(pyenv virtualenv-init -)"' >> $PYENV_INIT_SCRIPT

#Auto completions
echo 'if [ -n "$BASH" ]; then source $(pyenv root)/completions/pyenv.bash; fi' >> $HOME/.shrc.d/pyenv.sh
echo 'if [ -n "$ZSH_NAME" ]; then source $(pyenv root)/completions/pyenv.zsh; fi' >> $HOME/.shrc.d/pyenv.sh
