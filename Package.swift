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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/6.1.1/SyneriseSDK.xcframework.zip",
            checksum: "ee82523f8368fe4c7619912bb6535ed8a5425acf3ccb51e9cdb13ae487028cd6"
        )
    ]
)
