// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "NSMFoundation",
  platforms: [
    .iOS(.v11)
  ],
  products: [
    .library(name: "NSMFoundation", targets: ["NSMFoundation"]),
  ],
  dependencies: [],
  targets: [
    .target(name: "NSMFoundation"), 
    .testTarget(name: "NSMFoundationTests", dependencies: ["NSMFoundation"])
  ]
)
