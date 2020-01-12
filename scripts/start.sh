#!/bin/bash

SDK_ROOT=$HOME/AndroidSDK

JAVA_HOME="$SNAP/usr/lib/jvm/java-8-openjdk-amd64"
ANDROID_SDK_HOME="$HOME/.Android"

for var in "$@"
do
    if [[ $var == *"--sdk_root"* ]]; then
      SDK_ROOT=${var:11}
    fi

done

echo "SDK_ROOT=$SDK_ROOT"

exec "$SNAP/tools/bin/sdkmanager" "--sdk_root=$SDK_ROOT" "$@"
