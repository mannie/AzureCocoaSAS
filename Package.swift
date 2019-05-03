// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "AzureCocoaSAS",
    products: [
        .library(name: "AzureCocoaSAS", targets: ["AzureCocoaSAS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .exact("1.0.0"))
    ],
    targets: [
        .target(name: "AzureCocoaSAS", dependencies: [ "CryptoSwift" ]),
        .testTarget(name: "AzureCocoaSASTests", dependencies: ["AzureCocoaSAS"]),
    ]
)
