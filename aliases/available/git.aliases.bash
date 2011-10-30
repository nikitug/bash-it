#!/bin/bash

# Aliases
alias g='git'
alias get='git'
alias gcl='git clone'

# add
alias ga='git add'
alias gall='git add .'

# status
alias gst='git status'
alias gs='git status'
alias gss='git status -s'

# pull/fetch
alias gf='git fetch'
alias gu='git pull'
alias gur='git pull --rebase'
alias gup='git fetch && git rebase'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'

# push
alias gp='git push'
alias gpo='git push origin'

# commit
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gcv='git commit -v -a'
alias gcva='git commit -v -a'
alias gci='git commit --interactive'

# merge
alias gm='git merge --no-ff'
alias gmff='git merge'

# branch
alias gb='git branch'
alias gba='git branch -a'
alias gdel='git branch -D'

# diff
alias gd='git diff'
case $OSTYPE in
  linux*)
    alias gdv='git diff -w "$@" | vim -R -'
    ;;
  darwin*)
    alias gdm='git diff | mate'
    ;;
  darwin*)
    alias gd='git diff'
    ;;
esac
alias gd1='echo "git diff HEAD";  git diff HEAD'
alias gd2='echo "git diff HEAD^"; git diff HEAD^'

# log
alias gl='git log'
alias glt='git log --graph --pretty=oneline --abbrev-commit'

# Git submodule shortcuts
alias gsa='git submodule add'
alias gsu='git submodule update --init'

# Git svn shortcuts
alias gsf='git svn fetch'
alias gsfr='git svn fetch && git svn rebase'
alias gsdc='git svn dcommit --add-author-from --use-log-author'
alias gssy='gsfr && gsdc'

#
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcount='git shortlog -sn'
alias gexport='git archive --format zip --output'
alias grmall="git status | grep 'deleted:' | awk '{print \$3}' | xargs git rm -f"

function git-help() {
  echo "Git Custom Aliases Usage"
  echo
  echo "  gcl	  = git clone"
  echo "  g       = git"
  echo "  get 	  = git"
  echo "  ga      = git add"
  echo "  gall	  = git add ."
  echo "  gst/gs  = git status"
  echo "  gss	  = git status -s"
  echo "  gl      = git pull"
  echo "  gup     = git fetch && git rebase"
  echo "  gp      = git push"
  echo "  gd      = git diff | mate"
  echo "  gdv     = git diff -w \"$@\" | vim -R -"
  echo "  gc      = git commit -v"
  echo "  gca     = git commit -v -a"
  echo "  gci 	  = git commit --interactive"
  echo "  gb      = git branch"
  echo "  gba     = git branch -a"
  echo "  gcount  = git shortlog -sn"
  echo "  gcp     = git cherry-pick"
  echo "  gco     = git checkout"
  echo "  gexport = git git archive --format zip --output"
  echo "  gdel    = git branch -D"
  echo "  gpo     = git push origin"
  echo "  gmu     = git fetch origin -v; git fetch upstream -v; git merge upstream/master"
  echo "  gll     = git log --graph --pretty=oneline --abbrev-commit"
  echo
}
