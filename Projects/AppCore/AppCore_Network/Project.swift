import ProjectDescription

let project = Project(
  name: "AppCore_Network",
  targets: [
    Target.target(
      name: "AppCore_Network",
      destinations: [.iPhone],
      product: .staticFramework,
      bundleId: "com.example.core.network",
      deploymentTargets: .iOS("15.0"),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: [],
      dependencies: [
        .project(
          target: "Shared_Foundation",
          path: .relativeToRoot("Projects/Shared/Shared_Foundation")
        ),
        .external(name: "Moya"),
        .external(name: "RxMoya"),
        .external(name: "ObjectMapper"),
      ]
    )
  ]
)
