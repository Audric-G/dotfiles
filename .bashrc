#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '

# set nvim as my default editor
export EDITOR=nvim

# set alias config for my dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Function for combining mkdir & cd
mkcdir ()
{
  mkdir -p -- "$1" &&
  cd    -P -- "$1"
}
