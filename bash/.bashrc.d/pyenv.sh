#!/bin/sh
#
# dotfiles/bash/.bashrc.d/pyenv.sh: Setup PyEnv
# vim: ts=2 sw=2 cc=80 et

PYENV_ROOT="${HOME}/.pyenv"
export PYENV_ROOT

pathprepend "${PYENV_ROOT}/bin"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v pyenv-virtualenv-init 1>/dev/null 2>&1; then
  eval "$(pyenv virtualenv-init -)"
fi
