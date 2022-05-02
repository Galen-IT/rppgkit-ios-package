// swift-tools-version:5.6
// MARK: - Package Description
import PackageDescription

// ⚠️ ensure this flag is 'false' before commiting
let localDependencies = false

// MARK: - Package Configuration
let package = Package(
    name: "galenit-rppg",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "GalenitRppgKit",
            targets: ["GalenitRppgKit"]),
    ],
    dependencies: localDependencies ? Package.localDeps : Package.remoteDeps,
    targets: [
        .target(
            name: "GalenitRppgKit",
            dependencies: Package.galenitRppgKitDependencies
        ),
        .binaryTarget(
            name: "GalenitRPPG",
            url: "https://github.com/Galen-IT/rppgkit-ios-package/releases/download/1.0.7/GalenitRPPG.xcframework.zip",
            checksum: "27227781f2c8cf4e88a0e1ef98e9f3b605a0b1e460e3ce2e65fad23bb2514d4f"
        )
    ]
)

// MARK: -- Dependencies
extension Package {
    static var remoteDeps: [Package.Dependency] {
        [
            .package(url: "git@github.com:Galen-IT/xpcore-ios-package.git", from: "1.0.4"),
            .package(url: "git@github.com:Galen-IT/binah-ios-package.git", from: "1.0.8"),
        ]
    }

    static var localDeps: [Package.Dependency] {
        [
            .package(path: "../xpcore-ios-package"),
            .package(path: "../binah-ios-package"),
        ]
    }
    
    static var galenitRppgKitDependencies: [Target.Dependency] {
        [
            "GalenitRPPG",
            .product(name: "GalenitXpCore", package: "xpcore-ios-package"),
            .product(name: "GalenitBinah", package: "binah-ios-package")
        ]
    }
}
