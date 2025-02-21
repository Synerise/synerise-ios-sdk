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
            url: "https://github.com/Synerise/synerise-ios-sdk/releases/download/4.24.2/SyneriseSDK.xcframework.zip",
            checksum: "4d193b019c2dfe02d77035059da0e6c46bf5d4eb76e6dbfcb4be8d38f880e45c"
        )
    ]
)
