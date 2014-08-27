#!/bin/bash

## tree.sh
# A fs-tree displayer

alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^\/]*\//|  /g' -e 's/|  \([^|]\)/'--\1/g'"
