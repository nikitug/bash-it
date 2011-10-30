#!/usr/bin/env bash

bashit_install_functions="`dirname $0`/functions.bash"
[[ -s "${bashit_install_functions}" ]] && source "${bashit_install_functions}"

bashit_repo="nikitug/bash-it"
bashit_repo_branch="nikitug"
bashit_path="${HOME}/.bash_it"
bashit_install_configuration="nikitug"

__bashit_update_remote
