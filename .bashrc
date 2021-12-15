# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# some more ls aliases
alias ls='ls --color'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# Allow usage of Ctrl-s in vim
stty -ixon

# For clear coloring
# export PS1="\[\e[0;0m\]\u@\h:\[\e[0;32m\]\w$ \[\e[0;36m\]"
export PS1="\u@\h:\w$ "

alias gitcd="cd \"\$(git rev-parse --show-toplevel)\""



export TERM=xterm-256color

alias sudo="sudo -E"

export EDITOR="vim"


source $HOME/.bashrc.local

export LC_ALL=en_US.UTF-8
export LANG=en_us.UTF-8
export LC_CTYPE=en_US.UTF-8

export HISTIGNORE='rm \*:rm -rf \*:rm -f \*'
