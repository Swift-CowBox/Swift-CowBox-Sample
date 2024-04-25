// swift-tools-version: 5.9.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Benchmarks",
  platforms: [
    .macOS("13.3"),
  ],
  dependencies: [
    .package(
      name: "FoodTruckKit",
      path: ".."
    ),
    .package(
      url: "https://github.com/ordo-one/package-benchmark",
      branch: "main"
    ),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .executableTarget(
      name: "Benchmarks",
      dependencies: [
        "FoodTruckKit",
        .product(
          name: "Benchmark",
          package: "package-benchmark"
        ),
      ],
      plugins: [
        .plugin(
          name: "BenchmarkPlugin",
          package: "package-benchmark"
        ),
      ]
    ),
  ]
)
