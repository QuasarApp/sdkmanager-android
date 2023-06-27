# Android SDK in snap-store
[![androidsdk](https://snapcraft.io//androidsdk/badge.svg)](https://snapcraft.io/androidsdk)
[![androidsdk](https://snapcraft.io//androidsdk/trending.svg?name=0)](https://snapcraft.io/androidsdk)

<h1 align="center">
  <img src="https://raw.githubusercontent.com/EndrII/sdkmanager-android/master/res/android%20sdk%20(snap-store).png" alt="">
  <br />
</h1>

## Description 

  This is snap version of console sdk manager for Android. For more information about sdkmanager see official google [documentation](https://developer.android.com/studio/command-line/sdkmanager) 
  
  ### sdkmanager 

  The sdkmanager is a command line tool that allows you to view, install, update, and uninstall packages for the Android SDK. If you're using Android Studio, then you do not need to use this tool and you can instead manage your SDK packages from the IDE. 
  The sdkmanager tool is provided in the Android SDK Tools package (25.2.3 and higher) and is located in ~/AndroidSDK. 
  
## Install

    sudo snap install androidsdk

or download from:

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/androidsdk)
    

## Build
    sudo snap install snapcraft --classic
    snapcraft 

## Using

``` bash
androidsdk [options]
```

### Use custom sdk root dir 

``` bash
androidsdk --sdk_root /my/sdk/root/dir [options]

```

[Androidsdk options](https://developer.android.com/studio/command-line/sdkmanager) 
