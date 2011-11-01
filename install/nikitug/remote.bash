#!/usr/bin/env bash

[[ -n "${bashit_path}" ]] || bashit_path="${HOME}/.bash_it"

for type in "aliases" "plugins" "completion"
do
  mkdir -p "$bashit_path/$type/enabled"
done

