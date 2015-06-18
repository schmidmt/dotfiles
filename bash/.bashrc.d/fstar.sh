#!/bin/sh
#
# dotfiles/bash/.bashrc.d/fstar.sh: DESCRIPTION
# vim: ts=2 sw=2 cc=80

if which thefuck >/dev/null; then
  alias fck='eval $(thefuck $(fc -ln -1)); history -r'
fi
