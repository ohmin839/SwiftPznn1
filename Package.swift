// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPznn1",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftPznn1",
            dependencies: ["SwiftPznn1Core"]),
        .target(
            name: "SwiftPznn1Core",
            dependencies: []),
        .target(
            name: "SwiftPznn1DeepLearning",
            dependencies: []),
        .testTarget(
            name: "SwiftPznn1Tests",
            dependencies: ["SwiftPznn1"]),
        .testTarget(
            name: "SwiftPznn1CoreTests",
            dependencies: ["SwiftPznn1Core"]),
    ]
)
