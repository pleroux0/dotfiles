#!/bin/sh

PYENV_ROOT=${PYENV_ROOT:-$HOME/.pyenv}
PYENV_USER=${PYENV_USER:-$(whoami)}
PYENV_GIT=${PYENV_GIT:-https://github.com/pyenv/pyenv.git}
PYENV_VIRTUALENV_GIT=${PYENV_VIRTUALENV_GIT:-https://github.com/pyenv/pyenv-virtualenv.git}

# Create directories
mkdir -p "$HOME/.shrc.d"
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
echo 'if [ -n "$PYENV_ENABLED" ]; then return 0; fi' > $HOME/.shrc.d/pyenv.sh
echo "export PYENV_ENABLED=1" >> $HOME/.shrc.d/pyenv.sh
echo "export PATH=$PYENV_ROOT/bin:\$PATH" >> $HOME/.shrc.d/pyenv.sh
echo 'eval "$(pyenv init -)"' >> $HOME/.shrc.d/pyenv.sh
echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.shrc.d/pyenv.sh

#Auto completions
echo 'if [ -n "$BASH" ]; then source $(pyenv root)/completions/pyenv.bash; fi' >> $HOME/.shrc.d/pyenv.sh
echo 'if [ -n "$ZSH_NAME" ]; then source $(pyenv root)/completions/pyenv.zsh; fi' >> $HOME/.shrc.d/pyenv.sh
