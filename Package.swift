// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "galenit-rppg",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "GalenitRppgKit",
            targets: ["GalenitRppgKit"]),
    ],
    dependencies: [
        .package(
            url: "git@github.com:galen-it/xpcore-ios-package.git",
            .rangeItem(.upToNextMinor(from: Version(1, 0, 1)))
        ),
        .package(
            url: "git@github.com:galen-it/binah-ios-package.git",
            .rangeItem(.upToNextMinor(from: Version(1, 0, 2)))
        )
    ],
    targets: [
        .target(
            name: "GalenitRppgKit",
            dependencies: [
                "GalenitRPPG",
                .product(name: "GalenitXpCore", package: "xpcore-ios-package"),
                .product(name: "GalenitBinah", package: "binah-ios-package")
            ]
        ),
        .binaryTarget(
            name: "GalenitRPPG",
            url: "https://github.com/Galen-IT/rppgkit-ios-package/releases/download/1.0.0/GalenitRPPG.xcframework.zip",
            checksum: "6f6cf3e0d3f0503a461fb627818031eb315b231d01a1c305569c7277c53f5e69"
        )
    ]
)
