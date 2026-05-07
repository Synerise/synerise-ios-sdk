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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/5.13.1/SyneriseSDK.xcframework.zip",
            checksum: "94580ba79b2f5e793673bf1ce92adefa4eebf846620ee9e8a389effe3f758d60"
        )
    ]
)
