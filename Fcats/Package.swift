// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Fcats",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", .upToNextMinor(from: "1.7.0")),
        .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.5.0")),
        .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", .upToNextMinor(from: "1.11.0")),
        .package(url: "https://github.com/OpenKitten/MongoKitten.git", .upToNextMinor(from: "4.1.0")),
        .package(url: "https://github.com/IBM-Swift/SwiftyRequest.git", .upToNextMinor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: ["Fcats"]),
        .target(
            name: "Fcats",
            dependencies: ["HeliumLogger", "Kitura", "KituraStencil", "MongoKitten"]),
        .testTarget(
            name: "FcatsTests",
            dependencies: ["Fcats", "SwiftyRequest"])
    ]
)
