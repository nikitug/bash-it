#!/usr/bin/env bash

[[ -n "${bashit_path}" ]] || bashit_path="${HOME}/.bash_it"

for type in "aliases" "plugins" "completion"
do
  mkdir -p "$bashit_path/$type/enabled"
done

# install plugins
for plugin in "browser" "vagrant"
do
  [[ -s "$bashit_path/plugins/available/$plugin.plugin.bash" ]] && ln -s "$bashit_path/plugins/available/$plugin.plugin.bash" "$bashit_path/plugins/enabled"
  [[ -s "$bashit_path/plugins/available/$plugin.plugins.bash" ]] && ln -s "$bashit_path/plugins/available/$plugin.plugins.bash" "$bashit_path/plugins/enabled"
done

# install completions
for completion in "projects"
do
  [[ -s "$bashit_path/completion/available/$completion.completion.bash" ]] && ln -s "$bashit_path/completion/available/$completion.completion.bash" "$bashit_path/completion/enabled"
done

