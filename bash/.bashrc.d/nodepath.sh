#!/bin/sh
#
# dotfiles/bash/.bashrc.d/nodepath.sh: Add node modules to path
# vim: ts=2 sw=2 cc=80

_set_node_bin() {
	CURRENT_NODE_BIN="$NODE_BIN"
	export NODE_BIN=$(fsbranchfind "node_modules/.bin")
	case "$?" in
		0)
			pathprepend "$NODE_BIN"
			return 0
			;;
		*)
			pathremove "$CURRENT_NODE_BIN"
			return 1
	esac
}
