#!/usr/bin/env bash

con_wifi(){
	local SSID=$1
	nmcli device wifi connect $SSID
}

get_ip(){
	local DEVICE=$1
	local VALUE=$(ip -4 -j addr | jq --arg device $DEVICE '.[] | select(.ifname == $device) | .addr_info.[0].local' | sed 's/"//g')
	echo ${VALUE:-None}
}
