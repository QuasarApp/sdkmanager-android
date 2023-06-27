#!/bin/bash

EXTERNAL_HOME=/home/$USER

if [ "$USER" = "root" ]
then
    EXTERNAL_HOME=/root
fi

OLD_SDK_ROOT=$HOME/AndroidSDK
SDK_ROOT=$EXTERNAL_HOME/AndroidSDK

export JAVA_HOME="$SNAP/usr/lib/jvm/java-11-openjdk-amd64"
export ANDROID_SDK_HOME="$HOME/.Android"
export _JAVA_OPTIONS=-Duser.home=$HOME

for var in "$@"
do
    if [[ $var == *"--sdk_root"* ]]; then
      SDK_ROOT=${var:11}
    fi

done

if [ -d "$OLD_SDK_ROOT" ] && [ ! -L "$OLD_SDK_ROOT" ] && [ "$(ls -A $OLD_SDK_ROOT)" ]
then
    echo "The default sdk folder has been changed from $OLD_SDK_ROOT to $SDK_ROOT ."
    echo "The Old location of sdk root have big problems with update the androidsdk package."
    echo "For more information about this problem see the https://github.com/QuasarApp/sdkmanager-android/issues/2 issue."
    echo ""

    if [ ! -d $SDK_ROOT ]
    then
        mkdir $SDK_ROOT
    else 
        if [ "$(ls -A $SDK_ROOT)" ]; then
          echo "The $SDK_ROOT dir is not empty. Please move all data to an another location and run the androdisdk again"
          exit 1
        else
          rm -d $SDK_ROOT
        fi
    fi

    mv $OLD_SDK_ROOT $EXTERNAL_HOME

    if [ "$?" = "0" ]; then
      echo "All your installed sdk files has been moved to new location."
      echo "If you want change a sdk location please use the --sdk_root option."
      ln -s $SDK_ROOT $OLD_SDK_ROOT 
    else 
      echo "Unknown error occurred."
      echo "Please report this issue to us. You can report a problem here:"
      echo "https://github.com/QuasarApp/sdkmanager-android/issues/new"
      exit $status
    fi 

fi

echo "SDK_ROOT=$SDK_ROOT"

exec "$SNAP/cmdline-tools/bin/sdkmanager" "--sdk_root=$SDK_ROOT" "$@"
