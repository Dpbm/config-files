#!/usr/bin/env bash

set -e 

source ./utils.sh

for file in "${from_home[@]}"; do
	copy_file_to "./$file" $HOME
done
for file in "${from_home_config[@]}"; do
	copy_file_to "./$file" "$HOME/.config/"
done

