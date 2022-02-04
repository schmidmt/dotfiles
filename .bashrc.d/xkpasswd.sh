#!/bin/bash

# A routine for generating xkcd style passwords.

xkpasswd() {
  len=${1-4}
  sort -R /usr/share/dict/cracklib-small  | head -n ${len} | tr '\n' ' '; echo
}
