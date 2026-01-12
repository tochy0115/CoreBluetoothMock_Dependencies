// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreBluetoothMock_Dependencies",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CoreBluetoothMock_Dependencies",
            targets: ["CoreBluetoothMock_Dependencies"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/grpc/grpc-swift-2.git",
            from: "2.0.0"
        ),
        .package(
            url: "https://github.com/grpc/grpc-swift-nio-transport.git",
            from: "2.0.0"
        ),
        .package(
            url: "https://github.com/grpc/grpc-swift-protobuf.git",
            from: "2.1.0"
        ),
        .package(
            url: "https://github.com/apple/swift-protobuf.git",
            from: "1.33.1"
        ),
        .package(
            url: "https://github.com/apple/swift-nio.git",
            from: "2.0.0"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CoreBluetoothMock_Dependencies",
            dependencies: [
                .product(name: "GRPCCore", package: "grpc-swift-2"),
                .product(name: "GRPCNIOTransportHTTP2", package: "grpc-swift-nio-transport"),
                .product(name: "GRPCProtobuf", package: "grpc-swift-protobuf"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                .product(name: "NIO", package: "swift-nio"),
            ]),
        .testTarget(
            name: "CoreBluetoothMock_DependenciesTests",
            dependencies: ["CoreBluetoothMock_Dependencies"]),
    ]
)
