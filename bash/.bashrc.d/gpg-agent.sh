#!/bin/sh
#
# /home/schmidmt/dotfiles/bash/.bashrc.d/gpg-agent.sh: Startup gpg-agent
# vim: ts=2 sw=2 cc=80

# Set GPG TTY
GPG_TTY=$(tty)
export GPG_TTY

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
