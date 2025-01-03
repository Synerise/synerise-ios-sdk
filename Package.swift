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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/5.0.0/SyneriseSDK.xcframework.zip",
            checksum: "ff79f6a122b5ced1f144b85a25c8977e12b9ded560824a0773a7fdb3538933d2"
        )
    ]
)
