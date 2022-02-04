#!/bin/sh
#
# dotfiles/bash/.bashrc.d/sbtenv.sh: SBTEnv Config
# vim: ts=2 sw=2 cc=80


if [ -e "${HOME}/.sbtenv" ]; then
    pathprepend "${HOME}/.sbtenv/bin"
fi

if [ -e "${HOME}/.scalaenv" ]; then
    pathprepend "${HOME}/.sbtenv/bin"
fi

if which sbtenv 2> /dev/null > /dev/null; then
    eval "$(sbtenv init -)"
fi
if which scalaenv 2> /dev/null > /dev/null; then
    eval "$(scalaenv init -)"
fi
