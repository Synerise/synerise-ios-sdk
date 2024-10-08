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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/4.23.1/SyneriseSDK.xcframework.zip",
            checksum: "a5892be5fa4e9ef33def6a9b271a3d8db2c12d7eb729140e9fb5fbf7f7a5c9bc"
        )
    ]
)
