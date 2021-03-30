#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='\u@\h:\W >'
PS1='\[\e[0;34m\]\u\[\e[m\] \[\e[1;36m\]\w\[\e[m\] \[\e[1;37m\]\$\[\e[m\] \[\e[1;37m\]'

# Aggiunti alias
alias ll='ls -la'
