#!/bin/sh

# Handle Pretty colored options for different cli tools

case "$(uname -s)" in
	Linux)
		alias ls='ls --color=auto --classify'
		alias grep='grep --color=auto'
		;;
	Darwin)
		which gls > /dev/null && alias ls="gls --color=auto --classify"
		which ggrep > /dev/null && alias grep="ggrep --color=auto"
		which gfind > /dev/null && alias find="gfind"
		;;
esac
