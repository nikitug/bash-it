#!/bin/bash

# List directory contents
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -l'
alias l1='ls -1'

alias _="sudo"

if [ $(uname) = "Linux" ]
then
  alias ls="ls --color=always"
fi
which gshuf &> /dev/null
if [ $? -eq 1 ]
then
  alias shuf=gshuf
fi

alias c='clear'
alias k='clear'
alias cls='clear'

alias edit="$EDITOR"
alias pager="$PAGER"

alias q="exit"

alias irc="$IRC_CLIENT"

alias rb="ruby"

# Pianobar can be found here: http://github.com/PromyLOPh/pianobar/
alias piano="pianobar"

alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up two directories
alias -- -="cd -"        # Go back

# Tree
if [ ! -x "$(which tree)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Directory
alias	md='mkdir -p'
alias	rd=rmdir

# Reload bashrc
alias f5="source ~/.bashrc"

# cd to bash_it
alias .bash="cd $BASH"

# grep
alias g?="grep"

# Shell History
alias h="history | grep"

function aliases-help() {
echo "Generic Alias Usage"
echo
echo "  sl      = ls"
echo "  ls      = ls -G"
echo "  la      = ls -AF"
echo "  ll      = ls -al"
echo "  l       = ls -a"
echo "  c/k/cls = clear"
echo "  ..      = cd .."
echo "  ...     = cd ../.."
echo "  -       = cd -"
echo "  h       = history | grep"
echo "  md      = mkdir -p"
echo "  rd      = rmdir"
echo "  editor  = $EDITOR"
echo "  pager   = $PAGER"
echo "  piano   = pianobar"
echo "  q       = exit"
echo "  g?      = grep"
echo "  irc     = $IRC_CLIENT"
echo "  md      = mkdir -p"
echo "  rd      = rmdir"
echo "  rb      = ruby"
echo "  f5      = source ~/.bashrc"
echo "  .bash   = cd $BASH"
echo
}
