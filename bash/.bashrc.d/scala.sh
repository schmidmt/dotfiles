#!/bin/sh
#
# dotfiles/bash/.bashrc.d/scala.sh: Set Up Scala Env
# vim: ts=2 sw=2 cc=80


if [ -d "${HOME}/.scalaenv" ]; then
	PATH="${HOME}/.scalaenv/bin:${PATH}"; export PATH
	eval "$(scalaenv init -)"
fi
