import ProjectDescription

let project = Project(
    name: "WeatherColor",
    targets: [
        .target(
            name: "WeatherColor",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.WeatherColor",
            infoPlist: .dictionary([
                // Minimal, scene-less Info.plist so AppDelegate-only entry works
                "CFBundleDevelopmentRegion": .string("$(DEVELOPMENT_LANGUAGE)"),
                "CFBundleExecutable": .string("$(EXECUTABLE_NAME)"),
                "CFBundleIdentifier": .string("$(PRODUCT_BUNDLE_IDENTIFIER)"),
                "CFBundleInfoDictionaryVersion": .string("6.0"),
                "CFBundleName": .string("$(PRODUCT_NAME)"),
                "CFBundlePackageType": .string("APPL"),
                "CFBundleShortVersionString": .string("$(MARKETING_VERSION)"),
                "CFBundleVersion": .string("$(CURRENT_PROJECT_VERSION)"),
                // Optional: simple launch screen placeholder (can remove if you have a storyboard/xib)
                "UILaunchScreen": .dictionary([:])
                // Note: UIApplicationSceneManifest is intentionally omitted so AppDelegate controls the UI
            ]),
            sources: ["WeatherColor/Sources/**"],
            resources: ["WeatherColor/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "WeatherColorTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.WeatherColorTests",
            infoPlist: .default,
            sources: ["WeatherColor/Tests/**"],
            resources: [],
            dependencies: [.target(name: "WeatherColor")]
        ),
    ]
)
