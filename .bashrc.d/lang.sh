#!/bin/sh

## lang.sh
# Set the language for the terminal

LANG_PRIORITY="en_US.UTF-8 en_US.utf8 en_US.US-ASCII POSIX C"

found=false
for DESIRED_LANG in $LANG_PRIORITY; do
  if (env -i locale -a | grep -q "${DESIRED_LANG}"); then
    LC_ALL="${DESIRED_LANG}"
    LANG="${DESIRED_LANG}"
    found=true
    break
  fi
done

if [ "$found" != "true" ]; then
  echo "Failed to set LANG and LC_ALL" >&2
fi

export LC_ALL
export LANG
