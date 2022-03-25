// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "galenit-package-rppg-sample",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "galenit-package-rppg-sample",
            targets: ["galenit-package-rppg-sample"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "galenit-package-rppg-sample",
            dependencies: ["GalenitRPPG"]
        ),
        .binaryTarget(
            name: "GalenitRPPG",
            url: "https://github.com/Galen-IT/FlowVit_PublicSDKs_iOS/releases/download/v1.0.0/GalenitRPPG.xcframework.zip",
            checksum: "51eebe5309088d88085fa2105ecb9e9dd6c033d8a22e32278cc81dbd8aedfe5d"
        )
    ]
)
