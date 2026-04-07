#!/usr/bin/env bash

set -e

source ./utils.sh

for file in "${from_home[@]}"; do
  copy_file "$HOME/$file"
done

for file in "${from_home_config[@]}"; do
  copy_file "$HOME/.config/$file"
done

for file in "${from_etc[@]}"; do
  sudo -E bash -c "$(declare -f copy_file); copy_file '/etc/$file'"
done
