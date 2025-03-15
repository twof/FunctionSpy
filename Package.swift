// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "FunctionSpy",
    platforms: [
      .macOS(.v14),
      .iOS(.v17)
    ],
    products: [
        .library(
            name: "FunctionSpy",
            targets: ["FunctionSpy"]),
    ],
    targets: [
        .target(
            name: "FunctionSpy"),
        .testTarget(
            name: "FunctionSpyTests",
            dependencies: ["FunctionSpy"]),
    ],
    swiftLanguageModes: [.v6]
)
