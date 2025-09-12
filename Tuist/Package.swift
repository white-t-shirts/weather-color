// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: [:]
    )
#endif

let package = Package(
    name: "WeatherColor",
    dependencies: [
      .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
      .package(url: "https://github.com/ReactorKit/ReactorKit.git", from: "3.0.0"),
      .package(url: "https://github.com/devxoul/Then.git", from: "3.0.0"),
      .package(url: "https://github.com/layoutBox/PinLayout.git", from: "1.0.0"),
      .package(url: "https://github.com/layoutBox/FlexLayout.git", from: "2.0.0"),
      .package(url: "https://github.com/Swinject/Swinject.git", from: "2.0.0"),
      .package(url: "https://github.com/devxoul/Pure.git", from: "1.1.4"),
    ]
)
