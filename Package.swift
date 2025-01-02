// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SyneriseSDK",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "SyneriseSDK", targets: ["SyneriseSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "SyneriseSDK",
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/4.24.1/SyneriseSDK.xcframework.zip",
            checksum: "59c7f48b48fae6a439fa46994a8b0f22ee67600c716e23c5b12cbf8057a52185"
        )
    ]
)
