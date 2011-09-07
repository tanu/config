# .zprofile


if [ -n "$SSH_AUTH_SOCK" ]; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

screen -xRU
