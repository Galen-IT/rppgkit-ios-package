// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "galenit-package-rppg-sample",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "galenit-package-rppg-sample",
            targets: ["galenit-package-rppg-sample"]),
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
            name: "galenit-package-rppg-sample",
            dependencies: [
                "GalenitRPPG",
                .product(name: "GalenitXpCore", package: "xpcore-ios-package"),
                .product(name: "GalenitBinah", package: "binah-ios-package")
            ]
        ),
        .binaryTarget(
            name: "GalenitRPPG",
            url: "https://github.com/Galen-IT/FlowVit_PublicSDKs_iOS/releases/download/v1.0.0/GalenitRPPG.xcframework.zip",
            checksum: "51eebe5309088d88085fa2105ecb9e9dd6c033d8a22e32278cc81dbd8aedfe5d"
        )
    ]
)
