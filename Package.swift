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
        .package(url: "git@github.com:Galen-IT/Galenit.XP.Core_iOS.git", revision: "3d8301f1b3a1e58b6421e654e02327c393c21a80"),
        .package(url: "git@github.com:Galen-IT/GalenitBinah_iOS.git", revision: "e2ab5df44b7432e1b14bceb7e808b5d949500dd1")
    ],
    targets: [
        .target(
            name: "galenit-package-rppg-sample",
            dependencies: [
                "GalenitRPPG",
                .product(name: "galenit_device_api", package: "Galenit.XP.Core_iOS"),
                .product(name: "GalenitBinah", package: "GalenitBinah_iOS")
            ]
        ),
        .binaryTarget(
            name: "GalenitRPPG",
            url: "https://github.com/Galen-IT/FlowVit_PublicSDKs_iOS/releases/download/v1.0.0/GalenitRPPG.xcframework.zip",
            checksum: "51eebe5309088d88085fa2105ecb9e9dd6c033d8a22e32278cc81dbd8aedfe5d"
        )
    ]
)
