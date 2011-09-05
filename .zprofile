# .bash_profile

ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock

export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

screen
