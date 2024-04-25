// swift-tools-version: 5.9.2

/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The FoodTruckKit package.
*/

import PackageDescription

let package = Package(
    name: "FoodTruckKit",
    defaultLocalization: "en",
    platforms: [
        .macOS("13.3"),
        .iOS("16.4"),
        .macCatalyst("16.4")
    ],
    products: [
        .library(
            name: "FoodTruckKit",
            targets: ["FoodTruckKit"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-cowbox/swift-cowbox.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "FoodTruckKit",
            dependencies: [
                .product(
                    name: "CowBox",
                    package: "swift-cowbox"
                ),
            ],
            path: "Sources"
        )
    ]
)
