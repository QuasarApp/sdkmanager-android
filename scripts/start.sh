#!/bin/bash

SDK_ROOT=$HOME/AndroidSDK

export JAVA_HOME="$SNAP/usr/lib/jvm/java-8-openjdk-amd64"
export ANDROID_SDK_HOME="$HOME/.Android"
export _JAVA_OPTIONS=-Duser.home=$HOME

for var in "$@"
do
    if [[ $var == *"--sdk_root"* ]]; then
      SDK_ROOT=${var:11}
    fi

done

echo "SDK_ROOT=$SDK_ROOT"

exec "$SNAP/cmdline-tools/bin/sdkmanager" "--sdk_root=$SDK_ROOT" "$@"
