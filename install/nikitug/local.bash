#!/usr/bin/env bash

[[ -n "${bashit_path}" ]] && bashit_path="${HOME}/.bash_it"

for type in "aliases" "plugins" "completion"
do
  mkdir -p "$bashit_path/$type/enabled"
done

# # install aliases
# for alias in ""
# do
#   ln -s "$bashit_path/aliases/available/$alias.bash" "$bashit_path/aliases/enabled"
# done

# install plugins
for plugin in "browser" "vagrant"
do
  ln -s "$bashit_path/plugins/available/$plugin.bash" "$bashit_path/plugins/enabled"
done

# # install completions
# for completion in ""
# do
#   ln -s "$bashit_path/completion/available/$completion.bash" "$bashit_path/completion/enabled"
# done

