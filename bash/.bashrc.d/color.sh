#!/bin/sh

if [ "$(uname -s)" == "Linux" ]; then
	alias ls='ls --color=auto --classify'
	alias grep='grep --color=auto'
fi
