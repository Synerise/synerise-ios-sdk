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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/5.9.0/SyneriseSDK.xcframework.zip",
            checksum: "e8d7873d4ce1cb68cc4c155203370f6bbd6bce4cafd2f0c742ebb1b4deb20e37"
        )
    ]
)
