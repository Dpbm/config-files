#!/bin/bash

export LANG=en_US.UTF-8

export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/usr/share:/usr/local/share:~/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"
export JDK_HOME="$JAVA_HOME"
export STUDIO_JDK="$JAVA_HOME"
export GRADLE_USER_HOME="$HOME"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
export PATH="$HOME/Android/Sdk/cmdline-tools/latest/bin:$PATH"
export PATH="$HOME/android-studio/bin:$PATH"
export PATH="/usr/local/cuda/bin:$PATH"
export PATH="$GOBIN:$PATH"


export NVM_DIR="$HOME/.config/nvm"
