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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/5.6.0/SyneriseSDK.xcframework.zip",
            checksum: "12a62b2e09ae04b0e09c8eb4aa426f9f1b05fee5ac904d8572f88edab7379ad8"
        )
    ]
)
