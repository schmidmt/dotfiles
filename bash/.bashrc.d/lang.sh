#!/bin/bash

## lang.sh
# Set the language for the terminal

DESIRED_LANG=en_US.utf8
FALLBACK_LANG=C

locale | grep ${DESIRED_LANG} > /dev/null 2>/dev/null
if [[ ${?} == 0 ]]; then
  export LC_ALL=${DESIRED_LANG}
else
  export LC_ALL=${FALLBACK_LANG}
fi
