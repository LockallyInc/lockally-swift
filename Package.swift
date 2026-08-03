// swift-tools-version:6.0
import PackageDescription

// Combined package for the Lockally iOS SDK:
//   • `Lockally`     — the generated OpenAPI client (copied in from sdk/ios at
//                      assembly time; git-ignored here — run sdk/assemble-ios.sh).
//   • `LockallyKit`  — the hand-written ergonomics + secure auth layer.
let package = Package(
    name: "Lockally",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(name: "Lockally", targets: ["Lockally"]),
        .library(name: "LockallyKit", targets: ["LockallyKit"]),
    ],
    targets: [
        .target(name: "Lockally", path: "Sources/Lockally"),
        .target(name: "LockallyKit", dependencies: ["Lockally"], path: "Sources/LockallyKit"),
        .testTarget(name: "LockallyKitTests", dependencies: ["LockallyKit"], path: "Tests/LockallyKitTests"),
    ],
    swiftLanguageModes: [.v6]
)
