#!/usr/bin/env bash

get_slug_random_part(){
	tr -dc 'A-Za-z0-9' </dev/urandom | head -c 13	
}

remove_spaces(){
	local INPUT=$(cat /dev/stdin)
	echo $INPUT | sed -E 's|[[:space:]]{2,}| |g' | tr '[:blank:]' '-'
}

remove_accents(){
	local INPUT=$(cat /dev/stdin)
	echo $INPUT | iconv -c -s -f UTF-8 -t ASCII//TRANSLIT
}

to_lowercase(){
	local INPUT=$(cat /dev/stdin)
	echo $INPUT | tr '[:upper:]' '[:lower:]'
}

remove_punctuation(){
	local INPUT=$(cat /dev/stdin)
	echo $INPUT | tr -d '[:punct:]'
}

parse_title(){
	local TITLE="$1"
	local PARSED_TITLE=$(echo $TITLE | remove_punctuation | remove_spaces | remove_accents | to_lowercase)
	echo "$PARSED_TITLE-$(get_slug_random_part)"
}

scaffold_post(){
	local POST_PATH="$1"
	local TITLE="$2"

	local SLUG=$(parse_title "$TITLE")
	local POST_SLUG_PATH="$POST_PATH/$SLUG"

	if [ ! -d "$POST_SLUG_PATH" ]; then
		mkdir -p "$POST_SLUG_PATH"
	fi

	touch "$POST_SLUG_PATH/index.md"
}
