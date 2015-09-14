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
if [[ $- != *i* ]] ; then
  # Shell is non-interactive.  Be done now!
  return
fi

# Load Library of helper functions and constants
source ~/.bashrc_lib

# Load Environment Name to load specific shell files
if [[ -e ${HOME}/.bash_env ]]; then
  export BASH_ENV=$(cat ${HOME}/.bash_env)
else
  BASH_ENV=''
fi

# Load scripts from .bashrc.d
for script in ${HOME}/.bashrc.d/*.sh; do
  if [[ -r ${script} ]]; then
    source ${script}
  fi
done

# GIT_PS1 Options
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

function __hostname_color() {
  declare -a hostcolors

  hostcolors+=( "\[\033[1;31m\]" )
  hostcolors+=( "\[\033[1;32m\]" )
  hostcolors+=( "\[\033[1;33m\]" )
  hostcolors+=( "\[\033[1;34m\]" )
  hostcolors+=( "\[\033[1;35m\]" )
  hostcolors+=( "\[\033[1;36m\]" )

  md5=$(hostname | md5sum | cut -d' ' -f1)
  dec_md5=$((16#${md5}))
  abs_dec_md5=${dec_md5#-}
  color_num=$(($abs_dec_md5 % ${#hostcolors[@]} ))
  echo ${hostcolors[${color_num}]}
}


function _update_ps1() {
  PREV_RET_VAL=$?
  PS1="${BGreen}\u@$(__hostname_color)\H"
  PS1="${PS1}${BBlue}:${PathShort}"
  if (( $(jobs | wc -l) > 0 )); then
    PS1="${PS1} ${BRed}(${Jobs})"
  fi
  if [ ! -z "$VIRTUAL_ENV" ]; then
    VE_NAME=$(basename "${VIRTUAL_ENV}")
    PS1="${PS1}${BYellow} (${VE_NAME})"
  fi
  PS1="${PS1}${BYellow}$(__git_ps1 " (%s)")"
  if (( ${PREV_RET_VAL} > 0)); then
    PS1="${PS1} ${On_IRed}\$${Color_Off} "
  else
    PS1="${PS1} \$${Color_Off} "
  fi

  export PS1
}
export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

