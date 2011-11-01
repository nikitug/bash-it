#!/usr/bin/env bash

[[ -z "$bashit_path" ]] && bashit_path="${HOME}/.bash_it"

for type in "aliases" "plugins" "completion"
do
  mkdir -p "$bashit_path/$type/enabled"
done

# install aliases
for alias in "bundler" "general" "git" "rails"
do
  [[ -s "$bashit_path/aliases/available/$alias.aliases.bash" ]] && ln -s "$bashit_path/aliases/available/$alias.aliases.bash" "$bashit_path/aliases/enabled"
done

# install plugins
for plugin in "base" "extract" "git" "nginx" "nvm" "ruby" "rvm" "ssh" "tmux" "tmuxinator" "z"
do
  [[ -s "$bashit_path/plugins/available/$plugin.plugin.bash" ]] && ln -s "$bashit_path/plugins/available/$plugin.plugin.bash" "$bashit_path/plugins/enabled"
  [[ -s "$bashit_path/plugins/available/$plugin.plugins.bash" ]] && ln -s "$bashit_path/plugins/available/$plugin.plugins.bash" "$bashit_path/plugins/enabled"
done

# install completions
for completion in "gem" "git" "rake" "ssh"
do
  [[ -s "$bashit_path/completion/available/$completion.completion.bash" ]] && ln -s "$bashit_path/completion/available/$completion.completion.bash" "$bashit_path/completion/enabled"
done

