# Android SDK in SNAP-STORE

## Description 

  This is snap version of console sdk manager for Android. For more information about sdkmanager see official google [documentation](https://developer.android.com/studio/command-line/sdkmanager) 
  
  ### sdkmanager 

  The sdkmanager is a command line tool that allows you to view, install, update, and uninstall packages for the Android SDK. If you're using Android Studio, then you do not need to use this tool and you can instead manage your SDK packages from the IDE. 
  The sdkmanager tool is provided in the Android SDK Tools package (25.2.3 and higher) and is located in android_sdk/tools/bin/. 
  
## Install

    sudo snap install androidsdk
    snap connect androidsdk:android-config

## Build
    sudo snap install snapcraft --classic
    snapcraft 
