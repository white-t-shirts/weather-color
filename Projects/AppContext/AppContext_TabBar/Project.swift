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
      target: "Shared_ReactiveX",
      path: .relativeToRoot("Projects/Shared/Shared_ReactiveX")
    ),
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
    .project(
      target: "Shared_ReactiveX",
      path: .relativeToRoot("Projects/Shared/Shared_ReactiveX")
    ),
    .project(
      target: "AppCore_UI",
      path: .relativeToRoot("Projects/AppCore/AppCore_UI")
    ),
  ],
  settings: .settings(base: [
    "OTHER_LDFLAGS": ["-ObjC"],           // 필요 시 "-all_load"로 테스트
    // FlexLayout 소스가 내부에서 #if SWIFT_PACKAGE로 YogaKit 임포트할 때
    // 강제로 활성화해야 하면 아래도 추가:
    // "OTHER_SWIFT_FLAGS": ["-DSWIFT_PACKAGE"]
  ])
)

let project = Project(
  name: name,
  targets: [interface, impl]
)
