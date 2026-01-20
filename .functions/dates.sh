#!/usr/bin/env bash

millis_to_date(){
	local MILLIS=$1
	date -d "@$(( MILLIS / 1000 ))" +%Y-%m-%d
}
