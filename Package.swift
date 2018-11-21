// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tyler.Support.Apple.AppKit",
    products: [
        .library(name: "Tyler.Support.Apple.AppKit", targets: ["TylerSupportAppleAppKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IgorMuzyka/Tyler.Variable", .branch("master")),
        .package(url: "https://github.com/IgorMuzyka/Tyler.Style", .branch("master")),
        .package(url: "https://github.com/IgorMuzyka/Tyler.Tag", .branch("master")),
        .package(url: "https://github.com/IgorMuzyka/Tyler.Substitutes", .branch("master")),
    ],
    targets: [
        .target(name: "TylerSupportAppleAppKit", dependencies: [
            "Tyler.Variable", 
            "Tyler.Style", 
            "Tyler.Tag", 
            "Tyler.Substitutes"
        ]),
    ]
)
