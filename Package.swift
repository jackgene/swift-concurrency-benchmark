// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftConcurrencyBenchmark",
    platforms: [.macOS(.v10_15)],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-collections-benchmark",
            from: "0.0.2"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftConcurrencyBenchmark",
            dependencies: [
                .product(
                    name: "CollectionsBenchmark",
                    package: "swift-collections-benchmark"),
            ]),
    ]
)
