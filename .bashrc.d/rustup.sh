#!/bin/sh
#
# dotfiles/bash/.bashrc.d/rustup.sh: DESCRIPTION
# vim: ts=2 sw=2 cc=80

if [ -e "$HOME/.cargo" ]; then
	pathappend "$HOME/.cargo/bin"
fi

