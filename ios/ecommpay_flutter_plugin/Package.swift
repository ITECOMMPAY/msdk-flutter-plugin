// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ecommpay_flutter_plugin",
    platforms: [
        .iOS("16.6"),
    ],
    products: [
        .library(name: "ecommpay-flutter-plugin", targets: ["ecommpay_flutter_plugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ITECOMMPAY/mobile-sdk-ios-ui.git", exact: "4.0.1")
    ],
    targets: [
        .target(
            name: "ecommpay_flutter_plugin",
            dependencies: [
                .product(name: "EcommpaySDK", package: "mobile-sdk-ios-ui")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)