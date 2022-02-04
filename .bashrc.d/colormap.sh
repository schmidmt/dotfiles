#!/bin/bash
#
# dotfiles/bash/.bashrc.d/colormap.sh: Display a colormap
# vim: ts=2 sw=2 cc=80

# From: http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

colormap() {

	T='gYw'   # The test text

	printf "\n                 40m     41m     42m     43m     44m     45m     46m     47m\n";

	for FGs in 'm' '1m' '30m' '1;30m' '31m' '1;31m' '32m' '1;32m' '33m' '1;33m' '34m' '1;34m' '35m' '1;35m' '36m' '1;36m' '37m' '1;37m'; do
		FG=${FGs// /}
		printf '%6s %b  %s  ' "$FG" "\033[$FG" "$T"
		for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
			printf " %b%b  %s  %b" "\033[$FG" "\033[$BG" "$T" "\033[0m"
		done
		printf "\n"
	done
	printf "\n"
}
