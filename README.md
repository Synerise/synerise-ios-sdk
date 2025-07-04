# Synerise iOS SDK (v5.4.3)

[![Platform](https://img.shields.io/badge/platform-iOS-orange.svg)](https://github.com/synerise/synerise-ios-sdk)
[![Languages](https://img.shields.io/badge/language-Objective--C%20%7C%20Swift-orange.svg)](https://github.com/synerise/synerise-ios-sdk)
[![GitHub release](https://img.shields.io/github/release/Synerise/ios-sdk.svg)](https://github.com/Synerise/synerise-ios-sdk/releases) 
[![CocoaPods](https://img.shields.io/badge/pod-v5.4.3-green.svg)](https://cocoapods.org/pods/SyneriseSDK)
[![SPM compatible](https://img.shields.io/badge/SPM-Compatible-green.svg)](https://www.swift.org/package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![Synerise](https://img.shields.io/badge/www-synerise-green.svg)](https://synerise.com)
[![Documentation](https://img.shields.io/badge/docs-mobile%20sdk-brightgreen.svg)](https://hub.synerise.com/developers/mobile-sdk/)

---

## About
[Synerise](https://www.synerise.com) SDK for iOS.

## Documentation
Most up-to-date documentation is available at [Developer Guide - Mobile SDK](https://hub.synerise.com/developers/mobile-sdk).

## Requirements
* Access to workspace
* A Profile API Key
* Xcode 16 and iOS SDK 18
* iOS 13.0+ minimum deployment target
* Valid architectures: arm64 devices and arm64, x86_64 simulators

## Installing Synerise SDK with CocoaPods

CocoaPods is a dependency manager for Cocoa projects.
  
1. You can install it with the following command:

```
gem install cocoapods
```

2. Once you have CocoaPods installed you should add below code into your Podfile in Xcode:

```
platform :ios, '14.0'
use_frameworks!

target YOUR_PROJECT_TARGET do
  pod 'SyneriseSDK'
end
```

3. To install the Synerise SDK, run the following command in the directory of your Xcode app project:

```
pod install
```

4. When you want to upload to the latest version, execute the following command:

```
pod update
```

## Installing Synerise SDK with Swift Package Manager (SPM)

Swift Package Manager (SPM) is a dependency manager built into Xcode.
  
1. Go to Xcode project’s settings and navigate to the Package Dependencies tab.
2. Click on the add button below the packages list.
2. Enter the URL of Synerise SDK repository (**https://github.com/Synerise/synerise-ios-sdk**) in the search text field.
3. Under the Dependency Rule section, select the SDK version. Finally, click **Add Package**.
3. Select the package that best suits your needs and click **Add Package**.

## Installing Synerise SDK with Carthage

Carthage is a simple, decentralized dependency manager for iOS projects.
  
1. You can install it with the following command:

```
brew install carthage
```

2. Once you have CocoaPods installed you should add following line to your Cartfile:

```
github "synerise/ios-sdk"
```

3. To install the Synerise SDK, run the following command in the directory of your Xcode app project:
```
carthage update --use-xcframeworks --platform ios
```

4. Go to your Xcode project's "General" settings. Open `<YOUR_XCODE_PROJECT_DIRECTORY>/Carthage/Build/iOS` in Finder and drag `SyneriseSDK.framework` to the "Embedded Binaries" section in Xcode. Make sure `Copy items if needed` is selected and click `Finish`.


## Import Synerise SDK

You will need to import the **Synerise SDK** header into the files that contain code relating to **Synerise SDK**. 

**Swift:**
```
import SyneriseSDK
```

**Objective-C:**
```
<SyneriseSDK/SyneriseSDK.h>
```

In Objective-C, you can either include it in your AppName-Prefix.pch file.

## Initialization

First of all, you need to initialize Synerise iOS SDK and provide `Profile API Key`.

To get `Profile API Key`, please sign in to your Synerise account and visit [https://app.synerise.com/settings/apikeys](https://app.synerise.com/settings/apikeys).
Then, generate new `API Key` for `Profile` audience.

**Swift:**
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let apiKey = "YOUR_PROFILE_API_KEY"

    Synerise.initialize(apiKey: apiKey)
}
```

**Objective-C:**
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    static NSString *apiKey = @"YOUR_PROFILE_API_KEY";

    [SNRSynerise initializeWithApiKey:apiKey];
}
```
## Changelog
Changelog can be found [here](./CHANGELOG.md).

## Author
Synerise, developer@synerise.com. If you need support please feel free to contact us.
