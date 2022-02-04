#!/bin/bash

## notes.sh
# Add tools to make notes from bash

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
