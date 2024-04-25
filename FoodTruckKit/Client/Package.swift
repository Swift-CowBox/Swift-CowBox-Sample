// swift-tools-version: 5.9.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Client",
  platforms: [
    .macOS("13.3"),
  ],
  dependencies: [
    .package(
      name: "FoodTruckKit",
      path: ".."
    ),
  ],
  targets: [
    .executableTarget(
      name: "Client",
      dependencies: [
        "FoodTruckKit",
      ]
    ),
  ]
)
