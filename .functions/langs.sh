#!/usr/bin/env bash

install_zig() {
  set -e

  local ZIG_VERSION="$1"
  local VERSION_NAME="zig-x86-linux-$ZIG_VERSION"
  local VERSION_FILE="$VERSION_NAME.tar.xz"

  local TMP_PATH="/tmp"
  local VERSION_FILE_PATH="$TMP_PATH/$VERSION_FILE"
  local VERSION_SIGN_PATH="$TMP_PATH/$VERSION_FILE.minisig"

  local TARGET_FINAL_FOLDER="$HOME/zig/"
  local CURRENT_VERSION_PATH="$HOME/zig/zig"

  local FILE_URL="https://ziglang.org/download/$ZIG_VERSION/$VERSION_FILE"
  local SIGN_URL="$FILE_URL.minisig"

  curl -L "$FILE_URL" -O --output-dir "$TMP_PATH"
  curl -L "$SIGN_URL" -O --output-dir "$TMP_PATH"

  if ! minisign -V -x "$VERSION_SIGN_PATH" -m "$VERSION_FILE_PATH" -P "$ZIG_PUB_KEY"; then
    echo "Invalid signature!"
  else
    rm -rf "$CURRENT_VERSION_PATH"
    tar -xvf "$VERSION_FILE_PATH" -C "$TARGET_FINAL_FOLDER"
    ln -s "${TARGET_FINAL_FOLDER}${VERSION_NAME}/" "$CURRENT_VERSION_PATH"
  fi

}
