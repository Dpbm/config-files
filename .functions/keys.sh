#!/usr/bin/env bash

get_layout(){
	setxkbmap -query | grep layout | awk '{printf $2}'
}

switch_layout(){
	local CURRENT_LAYOUT=$(get_layout)
	case $CURRENT_LAYOUT in
		us)
			setxkbmap -layout br
			;;
		br)
			setxkbmap -layout us
			;;
		*)
			;;
	esac
}
