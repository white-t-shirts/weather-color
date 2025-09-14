import ProjectDescription

let project = Project(
  name: "AppContext_TabBar",
  targets: [
    Target.target(
      name: "AppContext_TabBar",
      destinations: [.iPhone],
      product: .staticFramework,
      bundleId: "com.example.context.tabbar",
      deploymentTargets: .iOS("15.0"),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: [],
      dependencies: [
        .external(name: "Then"),
        .external(name: "FlexLayout"),
        .external(name: "ReactorKit"),
        .external(name: "RxSwift"),
        .external(name: "RxCocoa"),
      ]
    )
  ]
)
