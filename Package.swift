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
            url: "https://github.com/Galen-IT/rppgkit-ios-package/releases/download/1.0.2/GalenitRPPG.xcframework.zip",
            checksum: "d330453414f769c07974d929c1d54de38b2dae4b2c61276d2dc942de6b1ce4c6"
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
