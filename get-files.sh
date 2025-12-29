#!/bin/bash

set -e

BLUE_BG="\e[44m"
ENDC="\e[0m"

copy_file(){
  FILE="$1"
  if [ -d $FILE ]; then
    echo -e "${BLUE_BG}Copying Direcoty ${FILE}...${ENDC}"
    cp -r $FILE .
  else
    echo -e "${BLUE_BG}Copying file ${FILE}...${ENDC}"
    cp $FILE .
  fi
}

copy_file "$HOME/.xinitrc"
copy_file "$HOME/.zprofile"
copy_file "$HOME/.zshrc"
copy_file "$HOME/.bashrc"
copy_file "$HOME/.functions/"
copy_file "$HOME/.aliases.sh"
copy_file "$HOME/.vars.sh"
copy_file "$HOME/.config/i3/"
copy_file "$HOME/.config/i3blocks/"


