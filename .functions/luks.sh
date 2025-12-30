#!/usr/bin/env bash

open_luks(){
	set -e

	local DEVICE=${1:-sda1}
	local MAP_TO=${2:-things}
	local TARGET_FOLDER=${3:-/media/things}

	sudo cryptsetup open /dev/$DEVICE $MAP_TO

	if [ ! -d $TARGET_FOLDER ]; then
		echo "Creating directory: $TARGET_FOLDER"
		mkdir -p $TARGET_FOLDER
	fi

	sudo mount /dev/mapper/$MAP_TO $TARGET_FOLDER
}
