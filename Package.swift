// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SyneriseSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "SyneriseSDK", targets: ["SyneriseSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "SyneriseSDK",
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/5.14.2/SyneriseSDK.xcframework.zip",
            checksum: "8b05cafcc3d830a271eb00105580e1bd91ce7f8a0bf8c805d445a37cfe910e2f"
        )
    ]
)
