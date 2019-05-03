// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AzureCocoaSAS",
    products: [
        .library(name: "AzureCocoaSAS", targets: ["AzureCocoaSAS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/crypto.git", .exact("3.3.2"))
    ],
    targets: [
        .target(name: "AzureCocoaSAS", dependencies: [ "Crypto" ]),
        .testTarget(name: "AzureCocoaSASTests", dependencies: ["AzureCocoaSAS"]),
    ]
)
