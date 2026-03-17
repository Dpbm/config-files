#!/usr/bin/env bash

switch_allow_site() {
  local WEBSITE="www.${1}.com"
  local HOSTS_FILE="/etc/hosts"
  local LINE_NUMBER=$(cat "$HOSTS_FILE" | grep -n "$WEBSITE" | awk '{printf $1}' | cut -d: -f1)
  local LINE_DATA=$(sed -n "${LINE_NUMBER}p" "$HOSTS_FILE")
  local FIRST_CHAR=$(echo "$LINE_DATA" | cut -c1)

  if [[ ! "$FIRST_CHAR" = "#" ]]; then
    echo "Allowing $WEBSITE..."
    local NEW_DATA="#${LINE_DATA}"
    sudo sed -i "${LINE_NUMBER}c\\${NEW_DATA}" "$HOSTS_FILE"
  else
    echo "Denying $WEBSITE..."
    local NEW_DATA=$(echo "$LINE_DATA" | cut -c2-)
    sudo sed -i "${LINE_NUMBER}c\\${NEW_DATA}" "$HOSTS_FILE"
  fi

}
