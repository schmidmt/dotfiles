#!/bin/sh
#
# dotfiles/bash/.bashrc.d/nodepath.sh: Add node modules to path
# vim: ts=2 sw=2 cc=80

_set_node_bin() {
	CURRENT_NODE_BIN="$NODE_BIN"
	NODE_BIN=$(fsbranchfind "node_modules/.bin")
	export NODE_BIN
	if [ "$NODE_BIN" != "$CURRENT_NODE_BIN" ]; then
		case "$?" in
			0)
				if [ ! -z "$NODE_BIN" ]; then
					pathprepend "$NODE_BIN"
				fi
				return 0
				;;
			*)
				pathremove "$CURRENT_NODE_BIN"
				return 1
				;;
		esac
	fi
}
