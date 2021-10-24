// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUINibbles",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
        .library(
            name: "Model",
            targets: ["Model"]),
        .library(
            name: "View",
            targets: ["View"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/onevcat/Kingfisher", from: "6.3.1"),
        .package(url: "https://github.com/CSolanaM/SkeletonUI", from: "1.0.5"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DesignSystem",
            dependencies: [
                "Model",
                .product(name: "Kingfisher", package: "Kingfisher"),
                .product(name: "SkeletonUI", package: "SkeletonUI"),
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "Model",
            dependencies: [],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "ModelTests",
            dependencies: ["Model"]
        ),
        .target(
            name: "View",
            dependencies: ["DesignSystem"]
        ),
    ]
)
