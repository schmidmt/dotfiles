#!/bin/bash

## exegy.sh
# Exegy specific shell addons


# Exit if not Exegy
if [[ ${BASH_ENV} != 'Exegy' ]]; then
  return
fi

#pretty colors on an ls and some aliases for viewing more stuff.
if [ `/bin/uname` == "Linux" ]; then
  alias rdesk='/usr/bin/rdesktop -u Administrator -g 1024x768 -r clipboard:PRIMARYCLIPBOARD'
#pretty colors don't work on the Sun (stupid Sun)
else
  alias ls="/bin/ls -F"
  alias la="/bin/ls -aF"
  alias ll="/bin/ls -alF" 
  alias l.="/bin/ls -alFd"
  alias :q="exit"
fi

#autologout sounds like a bad thing, so i set it to 0.
#set autologout=0

#set up paths for java 
#alias java /usr/java/bin/java
#alias javac /usr/java/bin/javac

#setenv CLASSPATH .:..:.classfiles

#set location for cvs root
#setenv CVSROOT /code/CVS-repository

#set root to your sources directory
export EXEGY_ROOT=/code/$USER/sources/ 

alias go='cd $EXEGY_ROOT/\!*'

#allow core files to be created, makes for easier debugging.
export CRASHDUMP=1

#allows you to run built binaries in your sources directories.  
export PATH="${PATH}:./bin.`uname -m`.debug:./bin.`uname -m`:${EXEGY_ROOT}bin.`uname -m`.debug:${EXEGY_ROOT}bin.`uname -m`"

#tell java where your prebuilt libraries might be
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:./lib.`arch`.debug:./lib.`arch`:${EXEGY_ROOT}lib.`arch`.debug:${EXEGY_ROOT}lib.`arch`
export LD_LIBRARY_PATH=".:..:/usr/lib64:/usr/lib/:./import/`uname -m`-Linux.debug:./import/`uname -m`-Linux:${EXEGY_ROOT}import/`uname -m`-Linux:${EXEGY_ROOT}import/`uname -m`-Linux/log4cxx"
#lets the rest of the group access your files by default
umask 2

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH="/svn/git/migration/gitewf:$PATH"

