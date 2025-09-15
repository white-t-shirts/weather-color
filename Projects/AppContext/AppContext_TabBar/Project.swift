import ProjectDescription

let name = "AppContext_TabBar"

let interface = Target.target(
  name: name,
  destinations: [.iPhone],
  product: .staticFramework,
  bundleId: "com.example.app.context.tabbar.interface",
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
  bundleId: "com.example.app.context.tabbar.impl",
  deploymentTargets: .iOS("15.0"),
  infoPlist: .default,
  sources: ["Sources/Implement/**"],
  dependencies: [
    .project(
      target: "Shared_Foundation",
      path: .relativeToRoot("Projects/Shared/Shared_Foundation")
    ),
    .external(name: "Then"),
    .external(name: "FlexLayout"),
    .external(name: "ReactorKit"),
    .external(name: "RxSwift"),
    .external(name: "RxCocoa"),
  ]
)

let project = Project(
  name: name,
  targets: [interface, impl]
)
