#!/bin/sh
#
# dotfiles/bash/.bashrc.d/python_venv_path.sh: Automatically activates and
# deactivates a python virtualenv when in subdirectory.
# vim: ts=2 sw=2 cc=80

_venv_activate() {
	CURRENT_VENV_PATH="$VENV_PATH"
	VENV_PATH=$(fsbranchfind ".venv")
	export VENV_PATH
	if [ "$VENV_PATH" != "$CURRENT_VENV_PATH" ] && [ ! -z "$VENV_PATH" ]; then
		case "$?" in
			0)
				# shellcheck source=/dev/null
				. "$VENV_PATH/bin/activate"
				return 0
				;;
			*)
				if type deactivate >/dev/null; then
					deactivate
				fi
				return 1
		esac
	fi
}
