#!/bin/sh
#
# dotfiles/bash/.bashrc.d/hub.sh: Add git alias for hub if it exists.
# vim: ts=2 sw=2 cc=80

if which hub >/dev/null; then
	alias git=hub
fi
