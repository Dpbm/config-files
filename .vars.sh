#!/bin/bash

remove_quotation_marks(){
  echo $1 | sed 's/\"//g'
}

export LANG=en_US.UTF-8

export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/usr/share:/usr/local/share:~/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"
export JDK_HOME="$JAVA_HOME"
export STUDIO_JDK="$JAVA_HOME"
export GRADLE_USER_HOME="$HOME"

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
export PATH="$HOME/Android/Sdk/cmdline-tools/latest/bin:$PATH"
export PATH="$HOME/android-studio/bin:$PATH"

# https://stackoverflow.com/questions/57700860/error-protoc-gen-go-program-not-found-or-is-not-executable
# https://protobuf.dev/reference/go/go-generated/
export GOBIN="$HOME/go/bin"
export PATH="$GOBIN:$PATH"

# NOT SECURE, BUT FINE FOR NOW
#export KAGGLE_TOKEN="$( remove_quotation_marks $(cat $HOME/.kaggle/kaggle.json | jq .key)  )"
#export KAGGLE_USERNAME="$( remove_quotation_marks $(cat $HOME/.kaggle/kaggle.json | jq .username) )"
#export HF_TOKEN="$( remove_quotation_marks $(cat $HOME/.huggingface/token.json | jq .token) )"
#export IBM_TOKEN="$( remove_quotation_marks $(cat $HOME/.ibm-qiskit/apikey.json | jq .apikey) )"

export SDKMAN_DIR="$HOME/.sdkman"

export NVM_DIR="$HOME/.config/nvm"
