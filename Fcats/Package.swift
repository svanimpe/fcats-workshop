// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Fcats",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.9.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura.git", from: "2.9.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", from: "1.11.0"),
        .package(url: "https://github.com/mongodb/mongo-swift-driver.git", from: "0.1.3"),
        .package(url: "https://github.com/IBM-Swift/SwiftyRequest.git", from: "3.1.0")
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: ["Fcats"]),
        .target(
            name: "Fcats",
            dependencies: ["HeliumLogger", "Kitura", "KituraStencil", "MongoSwift"]),
        .testTarget(
            name: "FcatsTests",
            dependencies: ["Fcats", "SwiftyRequest"])
    ]
)
