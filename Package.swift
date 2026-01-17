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
            url: "https://github.com/grpc/grpc-swift.git",
            from: "1.24.2"
        ),
        .package(
            url: "https://github.com/grpc/grpc-swift-nio-transport.git",
            from: "2.4.0"
        ),
        .package(
            url: "https://github.com/apple/swift-protobuf.git",
            from: "1.33.1"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CoreBluetoothMock_Dependencies",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "GRPCNIOTransportHTTP2", package: "grpc-swift-nio-transport"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
            ]),
        .testTarget(
            name: "CoreBluetoothMock_DependenciesTests",
            dependencies: ["CoreBluetoothMock_Dependencies"]),
    ]
)
