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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/5.4.3/SyneriseSDK.xcframework.zip",
            checksum: "7d4924a6a85d32a1f8f3056b1b741fc608ebb0bbd4a56e3e5949593a2cba583b"
        )
    ]
)
