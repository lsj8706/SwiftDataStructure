// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftDataStructure",
    products: [
        .library(
            name: "SwiftDataStructure",
            targets: ["SwiftDataStructure"])
    ],
    targets: [
        .target(
            name: "SwiftDataStructure",
            dependencies: []),
        .testTarget(
            name: "SwiftDataStructureTests",
            dependencies: ["SwiftDataStructure"]),
    ]
)
