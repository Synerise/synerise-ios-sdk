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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/5.9.3/SyneriseSDK.xcframework.zip",
            checksum: "93c8d6aab80932ed3c73b8e4fae2cea74c2aee8ce7acdadc5d3dfaf4e595f8ce"
        )
    ]
)
