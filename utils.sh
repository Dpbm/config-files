#! /usr/bin/env bash

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

copy_file_to(){
	FILE="$1"
	TO="$2"

	if [ ! -d $TO ]; then
		echo -e "${BLUE_BG}CREATING Direcoty ${TO}...${ENDC}"
		mkdir -p $TO
	fi

	
	if [ -d $FILE ]; then
		echo -e "${BLUE_BG}Copying Direcoty ${FILE}...${ENDC}"
		cp -r $FILE $TO
	else
	    	echo -e "${BLUE_BG}Copying file ${FILE}...${ENDC}"
	    	cp $FILE $TO
	fi
}


from_home=(".xinitrc" ".zprofile" ".zshrc" ".bashrc" ".functions/" ".aliases.sh" ".vars.sh")
from_home_config=("i3/" "i3blocks/" "dunst" "fontconfig")
