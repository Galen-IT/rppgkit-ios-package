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
            url: "https://github.com/Galen-IT/rppgkit-ios-package/releases/download/1.0.3/GalenitRPPG.xcframework.zip",
            checksum: "c189eda0d0ef115645b3f57f66f669da0819e3b298426188e61126d2d4fc98cf"
        )
    ]
)

// MARK: -- Dependencies
extension Package {
    static var remoteDeps: [Package.Dependency] {
        [
            .package(url: "git@github.com:Galen-IT/xpcore-ios-package.git", from: "1.0.1"),
            .package(url: "git@github.com:Galen-IT/binah-ios-package.git", from: "1.0.2"),
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
