#!/bin/bash

EXTERNAL_HOME=/home/$USER
OLD_SDK_ROOT=$HOME/AndroidSDK
SDK_ROOT=$EXTERNAL_HOME/AndroidSDK

export JAVA_HOME="$SNAP/usr/lib/jvm/java-8-openjdk-amd64"
export ANDROID_SDK_HOME="$HOME/.Android"
export _JAVA_OPTIONS=-Duser.home=$HOME

if [ "$(ls -A $OLD_SDK_ROOT)" ]; then
    echo "The default sdk folder has been changed from $OLD_SDK_ROOT to $SDK_ROOT ."
    echo "The Old location of sdk root have big problems with update the androidsdk package."
    echo "For more information about this problem see the https://github.com/QuasarApp/sdkmanager-android/issues/2 issue."
    echo ""

    if [ ! -d $SDK_ROOT ]
    then
        mkdir $SDK_ROOT
    fi

    mv $OLD_SDK_ROOT $EXTERNAL_HOME
    ln -s $SDK_ROOT $OLD_SDK_ROOT
    echo "All your installed sdk files has been moved to new location."
    echo "If you want change a sdk location please use the --sdk_root option."

fi

for var in "$@"
do
    if [[ $var == *"--sdk_root"* ]]; then
      SDK_ROOT=${var:11}
    fi

done

echo "SDK_ROOT=$SDK_ROOT"

exec "$SNAP/cmdline-tools/bin/sdkmanager" "--sdk_root=$SDK_ROOT" "$@"
