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
  ]
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
      target: "AppCore_UI",
      path: .relativeToRoot("Projects/AppCore/AppCore_UI")
    ),
    .project(
      target: "Shared_ReactiveX",
      path: .relativeToRoot("Projects/Shared/Shared_ReactiveX")
    ),
  ]
)

let project = Project(
  name: name,
  targets: [interface, impl]
)
