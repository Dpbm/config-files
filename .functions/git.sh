#!/bin/bash

init_repo(){
  LICENSE="$1"
  if [ -z "$LICENSE" ]; then
    LICENSE="MIT"
  fi

  git init
  reuse download $LICENSE -o LICENSE
}
