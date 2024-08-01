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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/4.19.1/SyneriseSDK.xcframework.zip",
            checksum: "8e1c33a48a49b1b0b95cb35f5a0e991fe81f32e05e7c4da764cd6ca5bf63fd9e"
        )
    ]
)
