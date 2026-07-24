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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/5.14.1/SyneriseSDK.xcframework.zip",
            checksum: "ce71a8d89577343baa313ca6a19638dc0bf5a3bf33699b6a6fa41eb8ee4c6a17"
        )
    ]
)
