# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt beep notify
unsetopt autocd
bindkey -e

setopt autopushd
setopt correct
setopt list_packed
setopt share_history
setopt hist_ignore_dups
setopt nolistbeep

setopt prompt_subst
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/h_tanaka/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#export LANG=Ja_JP.eucJP
export LANG=ja_JP.UTF-8

#for version control from here
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
#end

local RED="%{[31m%}"
local GREEN="%{[32m%}"
local YELLOW="%{[33m%}"
local BLUE="%{[34m%}"
local PINK="%{[35m%}"
local DEFAULT="%{[m%}"

PROMPT=$'\n'"[$PINK%n$DEFAULT@$PINK%m:$RED%/$DEFAULT][$BLUE%!$DEFAULT]"$'\n'"%# "
#PROMPT=$'\n'"[fg[pink]}%n$DEFAULT@$PINK%m:$RED%/$DEFAULT][$BLUE%!$DEFAULT]"$'\n'"%# "
RPROMPT="%1(v|%F{green}%1v%f|)[%D{%H:%M:%S}]"
#PROMPT2="%n @ %m %% "
PROMPT2="%{[31m%}%_%%%{[m$} "
SPROMPT="$RED%r is correct? [n,y,a,e]:$DEFAULT "

#[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    #PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"

[ -f ~/.alias ] &&
    source ~/.alias

if [ "$TERM" = "screen" ]; then
    preexec() { 
        #for vcs
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

        #  
        emulate -L zsh
        local -a cmd; cmd=(${(z)2})
        lang=`echo $LANG | sed "s/.\+\.\(.\).\+/\1/"`
        c=$cmd[1]
        echo -n "k${PWD/$HOME/~}:$c:t($lang)\\"
    }
    precmd() { # コマンドの実行後に呼び出される
        if [ "$c" = "cd" ]; then
            echo -n "k${PWD/$HOME/~}:$c:t($lang)\\"
        fi
    }
fi
