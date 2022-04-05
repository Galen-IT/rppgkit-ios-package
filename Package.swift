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
            url: "https://github.com/Galen-IT/rppgkit-ios-package/releases/download/1.0.1/GalenitRPPG.xcframework.zip",
            checksum: "2749d5b39147f2d552bd46a469d5afa9687dbb27f2199163d48dc691e27bd275"
        )
    ]
)
