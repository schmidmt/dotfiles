#!/bin/sh
#
# autoenv.sh: Automatically environmental variables based on fs.
# vim: ts=2 sw=2 cc=80


##
# AutoEnv GO
# Automatically sets GOPATH if a .go directory is found in fsbranch
# and add .go/bin to PATH
_autoenv_go() {
	CURRENT_GOPATH="$GOPATH"
	GOPATH=$(fsbranchfind ".go")
	found="$?"
	export GOPATH
	if [ "$GOPATH" != "$CURRENT_GOPATH" ]; then
		if [ "$found" -eq 0 ]; then
				if [ ! -z "$GOPATH" ]; then
					pathprepend "${GOPATH}/bin"
				fi
				return 0
		else
				pathremove "${CURRENT_GOPATH}/bin"
				return 1
		fi
	fi
}

##
# AutoEnv Env
# Automatically add alias for env which loads .env file.
_autoenv_env() {
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

##
# AutoEnv Node
# Automatically add node_modules/.bin to path
_autoenv_node() {
	CURRENT_NODE_BIN="$NODE_BIN"
	NODE_BIN=$(fsbranchfind "node_modules/.bin")
	found="$?"
	export NODE_BIN
	if [ "$NODE_BIN" != "$CURRENT_NODE_BIN" ]; then
		if [ "$found" -eq 0 ]; then
				if [ ! -z "$NODE_BIN" ]; then
					pathprepend "$NODE_BIN"
				fi
				return 0
		else
				pathremove "$CURRENT_NODE_BIN"
				return 1
		fi
	fi
}

##
# AutoEnv Python
# Automatically activate python VirtualEnv if .venv path is in branch.
_autoenv_python() {
	CURRENT_VENV_PATH="$VENV_PATH"
	VENV_PATH=$(fsbranchfind ".venv")
	found="$?"
	export VENV_PATH
	if [ "$VENV_PATH" != "$CURRENT_VENV_PATH" ]; then
		if [ "$found" -eq 0 ]; then
			if [ ! -z "$VENV_PATH" ]; then
				# shellcheck source=/dev/null
				. "$VENV_PATH/bin/activate"
			fi
			return 0
		else
			if type deactivate >/dev/null; then
				if isfunc deactivate; then
					deactivate
				else
					source deactivate
				fi
			fi
			return 1
		fi
	fi
}


##
# AutoEnv All
# Run all autoenv routines.
_autoenv() {
	_autoenv_env
	_autoenv_go
	_autoenv_python
	_autoenv_node
}

##
# AutoEnv describe
autoenv() {
	[ ! -z "$GOPATH" ] && printf "GOPATH=%s\n" "$GOPATH"
	[ ! -z "$VENV_PATH" ] && printf "VENV_PATH=%s\n" "$VENV_PATH"
	[ ! -z "$NODE_BIN" ] && printf "NODE_BIN=%s\n" "$NODE_BIN"
	[ ! -z "$ENV_PATH" ] && printf "ENV_PATH=%s\n" "$ENV_PATH"
	return 0
}


##
# AutoEnv string
_autoenv_str() {
	[ ! -z "$GOPATH" ] && printf ""
	[ ! -z "$VENV_PATH" ] && printf ""
	[ ! -z "$NODE_BIN" ] && printf ""
	[ ! -z "$ENV_PATH" ] && printf "E"
}

