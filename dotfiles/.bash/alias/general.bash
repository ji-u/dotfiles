#!/bin/bash

# ls
if ls --color -d . &> /dev/null; then
  alias ls="ls --color=auto"
elif ls -G -d . &> /dev/null; then
  alias ls="ls -G"
fi

alias sl=ls
alias la="ls -AF"
alias ll="ls -al"
alias l="ls -a"

# grep
if grep --color=auto "a" "${BASH_CONF}/alias/apt.bash" &> /dev/null; then
  alias grep="grep --color=auto"
  export GREP_COLOR='1;33'
fi

# clear
alias cls=clear

# cd
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# directory
alias mkdir='mkdir -p'
