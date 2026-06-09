#!/bin/bash

init_repo(){
  local LICENSE="$1"
  if [ -z "$LICENSE" ]; then
    LICENSE="MIT"
  fi

  git init
  reuse download $LICENSE -o LICENSE

  local YEAR=$(date | awk '{printf $NF}')
  sed -i "s|<year>|${YEAR}|g" ./LICENSE
  sed -i "s|<copyright holders>|${LICENSE_USER}|g" ./LICENSE
}
