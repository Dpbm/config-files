#!/usr/bin/env bash

INC_VOLUME=5

get_volume(){
	pactl get-sink-volume @DEFAULT_SINK@ | awk '{ printf "%s", $5 }' | sed 's/\%//g'
}

volume_up(){
	local volume=$(get_volume)
	if [ $volume -ge 100 ]; then
		return 1;
	fi

	pactl set-sink-volume @DEFAULT_SINK@ +$INC_VOLUME%
}

volume_down(){
	local volume=$(get_volume)
	if [ $volume -le 0 ]; then
		return 1;
	fi
	
	pactl set-sink-volume @DEFAULT_SINK@ -$INC_VOLUME%
}
