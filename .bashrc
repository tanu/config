# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

case $TERM in
 xterm*)
 export PS1="\n[\[\033[0;35m\]\u\[\033[0;30m\]@\[\033[0;35m\]\H:\[\033[0;31m\]\$(pwd -P)\033[0;30m\]][\[\033[0;34m\]\!\[\033[0;30m\]]\n\$ "
 ;;
 screen*)
 export PS1="\033k\033\\ \n[\[\033[0;35m\]\u\[\033[0;30m\]@\[\033[0;35m\]\H:\[\033[0;31m\]\$(pwd -P)\033[0;30m\]][\[\033[0;34m\]\!\[\033[0;30m\]]\n\$ "
 ;;
 *)
 export PS1="\$ "
 ;;
esac

# for attached screen

# User specific aliases and functions

set ignoreeof
set filec

set -o noclobber

if [ -f ~/.setenv ]; then
	. ~/.setenv
fi

if [ -f ~/.alias ]; then
	. ~/.alias
fi


case $OS in
    Windows*)
        if [ -f ~/.cygwinrc]; then
            . ~/.cygwinrc
        fi
    ;;
    *)
    ;;
esac
