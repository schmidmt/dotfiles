#/bin/bash

## keychain.sh
# Setup keychain for ssh and gpg

/usr/bin/keychain --quiet ~/.ssh/id_dsa
source ~/.keychain/${HOSTNAME}-sh > /dev/null
