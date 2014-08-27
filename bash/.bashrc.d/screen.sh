#!/bin/bash

## screen.sh
# Add modifications to make screen better

case "$TERM" in
  screen)
    TRUNC_HOST=`basename $HOSTNAME .cluster`
    PROMPT_COMMAND='echo -ne "\033k${TRUNC_HOST}\033\\"'
  ;;
esac

