#!/usr/bin/env bash

move_nf(){
	local FILE=$1
	local DELETE=${2:-no}
	local RATEIO_DATA_PATH="$HOME/projects/auto-cte-mdfe/rateio/data"
	if [[ $DELETE == "yes" ]]; then
		echo "Deleting old files..."
		sudo rm -rf $RATEIO_DATA_PATH/*
	fi
	sudo unzip $FILE -d $RATEIO_DATA_PATH	
}

list_xml_tmp(){
	ls -la /tmp | grep xml
}

start_rateio_server(){
	make -C "$HOME/projects/auto-cte-mdfe" start-docker
}
