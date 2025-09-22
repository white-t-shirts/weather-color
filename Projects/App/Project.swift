import ProjectDescription

let name = "App"

let interface = Target.target(
  name: name,
  destinations: [.iPhone],
  product: .staticFramework,
  bundleId: "com.example.\(name).interface",
  deploymentTargets: .iOS("15.0"),
  infoPlist: .default,
  sources: ["Sources/Interface/**"],
  settings: .settings(
    base: [
      "SWIFT_VERSION": "6.0",
      "SWIFT_STRICT_CONCURRENCY": "complete"
    ]
  )
)

let impl = Target.target(
  name: "\(name)_Impl",
  destinations: [.iPhone],
  product: .staticFramework,
  bundleId: "com.example.\(name).impl",
  deploymentTargets: .iOS("15.0"),
  infoPlist: .default,
  sources: ["Sources/Implement/**"],
  dependencies: [
    .target(name: name),
    .project(
      target: "Shared_Foundation",
      path: .relativeToRoot("Projects/Shared/Shared_Foundation")
    ),
    .project(
      target: "Shared_ReactiveX",
      path: .relativeToRoot("Projects/Shared/Shared_ReactiveX")
    ),
    .project(
      target: "AppContext_TabBar",
      path: .relativeToRoot("Projects/AppContext/AppContext_TabBar")
    ),
    .project(
      target: "AppFeature_Home",
      path: .relativeToRoot("Projects/AppFeature/AppFeature_Home")
    ),
    .project(
      target: "AppFeature_Setting",
      path: .relativeToRoot("Projects/AppFeature/AppFeature_Setting")
    ),
  ],
  settings: .settings(
    base: [
      "SWIFT_VERSION": "6.0",
      "SWIFT_STRICT_CONCURRENCY": "complete"
    ]
  )
)

let commonSettings = Settings.settings(
  base: [
    "SWIFT_VERSION": "6.0",
    "SWIFT_STRICT_CONCURRENCY": "complete"
  ]
)

let project = Project(
  name: name,
  settings: commonSettings,
  targets: [interface, impl]
)
