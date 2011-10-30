#!/bin/bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Path to the bash it configuration
export BASH=$HOME/.bash_it

# location /.bash_it/themes/
export BASH_THEME='nikitug'

# Set my editor and git editor
export EDITOR='vim'
export GIT_EDITOR='vim'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Load Bash It
source $BASH/bash_it.sh
