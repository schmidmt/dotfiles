#!/bin/bash
# ~/.bashrc
# vim:set et sts=0 sw=2 ts=2:
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
case "$-" in
  *i*)      ;;  # The shell is interactive so this should continue.
  *) return ;;  # The shell is non-interactive, return now.
esac

# Set the editor to vim
EDITOR=vim
export EDITOR

# Enable infinite history
HISTSIZE="INFINITE"
export HISTSIZE

# Load Library of helper functions and constants
# shellcheck source=/home/schmidmt/.bashrc_lib
. ~/.bashrc_lib

# Load Environment Name to load specific shell files
BASH_ENV=''
if [ -e "${HOME}/.bash_env" ]; then
  BASH_ENV="$(cat "${HOME}/.bash_env")"
fi
export BASH_ENV

# Load scripts from .bashrc.d
for script in ${HOME}/.bashrc.d/*.sh; do
  if [ -r "${script}" ]; then
    # shellcheck source=/dev/null
    . ${script}
  fi
done
for script in ${HOME}/.bashrc.d/local/*.sh; do
  if [ -r "${script}" ]; then
    # shellcheck source=/dev/null
    . ${script}
  fi
done

# GIT_PS1 Options
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

export GIT_PS1_SHOWDIRTYSTATE
export GIT_PS1_SHOWSTASHSTATE
export GIT_PS1_SHOWUPSTREAM
export GIT_PS1_SHOWCOLORHINTS

# VirtualEnv Disable Prompt
VIRTUAL_ENV_DISABLE_PROMPT=true
export VIRTUAL_ENV_DISABLE_PROMPT

_update_ps1() {
  # Store the previous exit code for later use
  PREV_RET_VAL=$?

  ## Environmental Modifiers
  _autoenv

  # Dynamically update PS1
  PS1=""

  if [ "$PS1_MIN" != true ]; then
    #PS1="${BGreen}\u@$(__hostname_color)\H"

    if [ ! -z "$SSH_CONNECTION" ]; then
      PS1="${PS1}$(__hostname_color)\h${Color_Off} "
    fi

    # Add check for sudo
    if [ ! -z "$SUDO_USER" ]; then
      PS1="${PS1} ${BYellow}(SUDO)${Color_Off}"
    fi

    PS1="${PS1}${BBlue}${PathShort}${Color_Off}"

    if [ "$(jobs | wc -l)" -gt 0 ]; then
      PS1="${PS1} ${BRed}${Color_Off}"
    fi

    # Add environmental indicators to path
    indicators="$(_autoenv_str)"
    if [ ! -z "$indicators" ]; then
      PS1="${PS1}${BIYellow}[${indicators}]${Color_Off}"
    fi

    # Add git environment to PS1
    PS1="${PS1}${BYellow}$(__git_ps1 " (%s)")"

  fi 

  # Add last exit status indicator
  if [ "${PREV_RET_VAL}" -ne 0 ]; then
    PS1="${PS1} ${BIRed}✖${Color_Off}"
  else
    PS1="${PS1} ${BIGreen}✔${Color_Off}"
  fi

  # Add some space at the end of PS1
  PS1="${PS1} "

  export PS1
  return $PREV_RET_VAL
}

# Add _update_ps1 function to prompt command if it isn't already there.
if ! contains "$PROMPT_COMMAND" "_update_ps1"; then
  export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# shellcheck source=/dev/null
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/schmidmt/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
. "$HOME/.cargo/env"
