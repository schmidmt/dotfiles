# /etc/skel/.bashrc
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

# Put your fun stuff here.

# drobbin's keychain 
/usr/bin/keychain --quiet ~/.ssh/id_dsa
source ~/.keychain/descartes-sh > /dev/null

case "$TERM" in
screen)
  TRUNC_HOST=`basename $HOSTNAME .cluster`
  PROMPT_COMMAND='echo -ne "\033k$TRUNC_HOST\033\\"'
  ;;
esac

# PythonPath
export PYTHONPATH=${PYTHONPATH}:~/pe

alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^\/]*\//|  /g' -e 's/|  \([^|]\)/'--\1/g'"
alias hosts="ssh root@admin03 'cat /var/named/chroot/var/named/named.cluster' | tail --lines=+21 | grep -v '^$' | grep -v '\*' | grep -v '^\;' | grep -v CNAME | awk '{print \$1}' | sort"

bssh() {
      ssh -t bumba "sudo ssh $@";
}

newnote() {
  notename=$1

  notedir=${nodedir:-$HOME/notes}
  if [[ ! -d ${notedir} ]]; then
    mkdir -p ${notedir}
  fi

  datestr=$(date +%Y%m%d%H%M)
  if [[ "x${notename}" == "x" ]]; then
    notefile="${notedir}/${datestr}.markdown"
    echo "Note: ${datestr}" > "${notefile}"
  else
    notefile="${nodedir}/${notename}.markdown"
    echo "Note: ${notename} (${datestr})" > "${notefile}"
  fi

  echo "==================" >> "${notefile}"

  gvim "${notefile}"
}



