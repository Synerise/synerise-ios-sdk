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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/4.19.0/SyneriseSDK.xcframework.zip",
            checksum: "1e2817386179960e76b38bebc07d1e9a5085f98a5f386f26cf93882d6e457d11"
        )
    ]
)
