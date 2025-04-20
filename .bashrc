#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\[\e[38;5;196m\]\u\[\e[38;5;15m\]@\[\e[38;5;196m\]\h \[\e[38;5;15m\]\w \[\033[0m\]]$ '
