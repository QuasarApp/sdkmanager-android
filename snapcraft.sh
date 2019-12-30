#!/bin/bash

BASE_DIR=$(dirname "$(readlink -f "$0")")

rm -f "$BASE_DIR/temp.zip"
rm -rdf "$BASE_DIR/source"

curl https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip --output "$BASE_DIR/temp.zip"
mkdir -p "$BASE_DIR/source"

unzip "$BASE_DIR/temp.zip" -d "$BASE_DIR/source"

chmod 777 -R "$BASE_DIR/source/"

snapcraft
