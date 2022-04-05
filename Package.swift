// swift-tools-version:5.6

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
            from: "1.0.1"
        ),
        .package(
            url: "git@github.com:galen-it/binah-ios-package.git",
            from: "1.0.2"
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
            url: "https://github.com/Galen-IT/rppgkit-ios-package/releases/download/1.0.2/GalenitRPPG.xcframework.zip",
            checksum: "d330453414f769c07974d929c1d54de38b2dae4b2c61276d2dc942de6b1ce4c6"
        )
    ]
)
