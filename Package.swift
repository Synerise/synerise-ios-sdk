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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/6.0.5/SyneriseSDK.xcframework.zip",
            checksum: "2225302b3abb5ab501cc1aabfe99266f416f8c0359d8c4d1f37a928d63ee37df"
        )
    ]
)
