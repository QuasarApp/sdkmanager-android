#!/bin/bash

chmod 777 "$SNAP/tools/bin/sdkmanager"

SDK_ROOT=$HOME/AndroidSDK

for var in "$@"
do
    if [[ $var == *"--sdk_root"* ]]; then
      SDK_ROOT=${var:11}
    fi

done

echo "SDK_ROOT=$SDK_ROOT"

exec "$SNAP/tools/bin/sdkmanager" "--sdk_root=$SDK_ROOT" "$@"
