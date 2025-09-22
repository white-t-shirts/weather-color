import ProjectDescription

let name = "AppFeature_Home"

let interface = Target.target(
  name: name,
  destinations: [.iPhone],
  product: .staticFramework,
  bundleId: "com.example.app.feature.home.interface",
  deploymentTargets: .iOS("15.0"),
  infoPlist: .default,
  sources: ["Sources/Interface/**"],
  dependencies: [
    .project(
      target: "AppCore_UI",
      path: .relativeToRoot("Projects/AppCore/AppCore_UI")
    ),
  ],
  settings: .settings(
    base: [
      "SWIFT_VERSION": "6.0",
      "SWIFT_STRICT_CONCURRENCY": "complete",
    ]
  ),
)

let impl = Target.target(
  name: "\(name)_Impl",
  destinations: [.iPhone],
  product: .staticFramework,
  bundleId: "com.example.app.feature.home.impl",
  deploymentTargets: .iOS("15.0"),
  infoPlist: .default,
  sources: ["Sources/Implement/**"],
  dependencies: [
    .project(
      target: "Shared_Foundation",
      path: .relativeToRoot("Projects/Shared/Shared_Foundation")
    ),
    .project(
      target: "Shared_ReactiveX",
      path: .relativeToRoot("Projects/Shared/Shared_ReactiveX")
    ),
    .project(
      target: "AppCore_UI",
      path: .relativeToRoot("Projects/AppCore/AppCore_UI")
    ),
    .project(
      target: "AppCore_Network",
      path: .relativeToRoot("Projects/AppCore/AppCore_Network")
    ),
    .project(
      target: "AppFeature_Home",
      path: .relativeToRoot("Projects/AppFeature/AppFeature_Home")
    ),
  ],
  settings: .settings(
    base: [
      "SWIFT_VERSION": "6.0",
      "SWIFT_STRICT_CONCURRENCY": "complete"
    ]
  ),
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
