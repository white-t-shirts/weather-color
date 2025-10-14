// swift-tools-version: 6.0
import PackageDescription

#if TUIST
import struct ProjectDescription.PackageSettings

let packageSettings = PackageSettings()
#endif

let package = Package(
  name: "WeatherColor",
  dependencies: [
    // Rx
    .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
    .package(url: "https://github.com/ReactorKit/ReactorKit.git", from: "3.0.0"),
    .package(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", from: "5.0.2"),

    // UI
    .package(url: "https://github.com/layoutBox/PinLayout.git", from: "1.0.0"),
    .package(url: "https://github.com/layoutBox/FlexLayout.git", from: "2.2.2"),
    .package(url: "https://github.com/devxoul/ReusableKit.git", from: "4.0.0"),

    // Foundation
    .package(url: "https://github.com/devxoul/Then.git", from: "3.0.0"),
    .package(url: "https://github.com/Swinject/Swinject.git", from: "2.0.0"),

    // Network
    .package(url: "https://github.com/Moya/Moya.git", from: "15.0.3"),
    .package(url: "https://github.com/tristanhimmelman/ObjectMapper.git", from: "4.4.3"),
  ]
)
