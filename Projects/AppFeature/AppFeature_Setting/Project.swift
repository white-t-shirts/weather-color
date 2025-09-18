import ProjectDescription

let name = "AppFeature_Setting"

let interface = Target.target(
  name: name,
  destinations: [.iPhone],
  product: .staticFramework,
  bundleId: "com.example.app.feature.setting.interface",
  deploymentTargets: .iOS("15.0"),
  infoPlist: .default,
  sources: ["Sources/Interface/**"],
  dependencies: [
    .project(
      target: "AppCore_UI",
      path: .relativeToRoot("Projects/AppCore/AppCore_UI")
    ),
  ]
)

let impl = Target.target(
  name: "\(name)_Impl",
  destinations: [.iPhone],
  product: .staticFramework,
  bundleId: "com.example.app.feature.setting.impl",
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
      target: "AppFeature_Setting",
      path: .relativeToRoot("Projects/AppFeature/AppFeature_Setting")
    ),
  ]
)

let project = Project(
  name: name,
  targets: [interface, impl]
)
