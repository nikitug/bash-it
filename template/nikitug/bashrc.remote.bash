#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  source /etc/bash_completion
fi

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Path to the bash it configuration
export BASH=$HOME/.bash_it

# location /.bash_it/themes/
export BASH_THEME='nikitug'
export BASH_ENV='remote'

# Set my editor and git editor
export EDITOR='vim'
export GIT_EDITOR='vim'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Load Bash It
source $BASH/bash_it.sh

export NLS_LANG=.AL32UTF8
export PATH=$PATH:/opt/android-sdk/platform-tools/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/instantclient10_1/

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

umask 022
