import ProjectDescription

let project = Project(
  name: "Data",
  targets: [
    Target.target(
      name: "Data",
      destinations: [.iPhone],
      product: .staticFramework,
      bundleId: "com.example.data",
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
        .project(
          target: "AppCore_Network",
          path: .relativeToRoot("Projects/AppCore/AppCore_Network")
        ),
        .project(
          target: "Domain",
          path: .relativeToRoot("Projects/Domain/Domain")
        ),
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
