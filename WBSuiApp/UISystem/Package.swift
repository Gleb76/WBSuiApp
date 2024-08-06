// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UISystem",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "UISystem",
            targets: ["UISystem"]),
    ],
    targets: [
        .target(
            name: "UISystem"),
        .testTarget(
            name: "UISystemTests",
            dependencies: ["UISystem"]),
    ]
)
