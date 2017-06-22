#!/bin/sh

# Handle Pretty colored options for different cli tools

case "$(uname -s)" in
	Linux)
		alias ls='ls --color=auto --classify'
		alias grep='grep --color=auto'
		;;
	Darwin)
		if which gls >/dev/null; then
			alias ls="gls --color=auto --classify"
			alias grep="ggrep --color=auto"
			alias find="gfind"
		fi
		;;
esac
