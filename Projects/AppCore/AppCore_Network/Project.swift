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
        .project(
          target: "Shared_ReactiveX",
          path: .relativeToRoot("Projects/Shared/Shared_ReactiveX")
        ),
        .external(name: "ObjectMapper"),
        .external(name: "Moya"),
        .external(name: "RxMoya"),
      ],
      settings: .settings(
        base: [
          "SWIFT_VERSION": "6.0",
          "SWIFT_STRICT_CONCURRENCY": "complete"
        ]
      )
    )
  ]
)
