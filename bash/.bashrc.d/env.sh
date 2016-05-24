#!/bin/sh
#
# dotfiles/bash/.bashrc.d/env.sh: Create alias for env to load local .env file
# vim: ts=2 sw=2 cc=80

_env_activate() {
	CURRENT_ENV_PATH="$ENV_PATH"
	ENV_PATH=$(fsbranchfind ".env"); FOUND="$?"
	export ENV_PATH
	if [ "$ENV_PATH" != "$CURRENT_ENV_PATH" ]; then
		if [ "$FOUND" -eq 0 ]; then
				if [ ! -z "$ENV_PATH" ]; then
					alias env="env \$(xargs < \${ENV_PATH})"
				fi
				return 0
		else
				alias env >/dev/null 2>/dev/null && unalias env
				return 1
		fi
	fi
}
