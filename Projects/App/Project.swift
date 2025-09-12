import ProjectDescription

let name = "App"

let interface = Target.target(
  name: name,
  destinations: [.iPhone],
  product: .staticFramework,
  bundleId: "com.example.\(name).interface",
  deploymentTargets: .iOS("15.0"),
  infoPlist: .default,
  sources: ["Sources/Interface/**"]
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
    .project(target: "Shared_Foundation", path: "../Shared/Shared_Foundation"),
    .external(name: "RxSwift"),
    .external(name: "Pure"),
  ]
)

let project = Project(
  name: name,
  targets: [interface, impl]
)
