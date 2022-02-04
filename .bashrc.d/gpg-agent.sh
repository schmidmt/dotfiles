#!/bin/sh
#
# /home/schmidmt/dotfiles/bash/.bashrc.d/gpg-agent.sh: Startup gpg-agent
# vim: ts=2 sw=2 cc=80

# Set GPG TTY
GPG_TTY=$(tty)
export GPG_TTY

if [ -z "${SSH_CONNECTION}" ]; then
	echo UPDATESTARTUPTTY | gpg-connect-agent 2>/dev/null >/dev/null

	unset SSH_AGENT_PID
	if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
		SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
		export SSH_AUTH_SOCK
	fi

	gpg_updatetty() {
		echo UPDATESTARTUPTTY | gpg-connect-agent 2>/dev/null >/dev/null
	}

	gpg() {
		gpg_updatetty
		command gpg "$@"
		return $?
	}

	git() {
		gpg_updatetty
		command git "$@"
		return $?
	}

	ssh() {
		gpg_updatetty
		command ssh "$@"
		return $?
	}

	rsync() {
		gpg_updatetty
		command rsync "$@"
		return $?
	}

	jake() {
		gpg_updatetty
		command jake "$@"
		return $?
	}

	mosh() {
		gpg_updatetty
		command mosh "$@"
		return $?
	}
fi
