import ProjectDescription

let project = Project(
  name: "AppCore_UI",
  targets: [
    Target.target(
      name: "AppCore_UI",
      destinations: [.iPhone],
      product: .staticFramework,
      bundleId: "com.example.core.ui",
      deploymentTargets: .iOS("15.0"),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: [],
      dependencies: [
        .project(
          target: "Shared_Foundation",
          path: .relativeToRoot("Projects/Shared/Shared_Foundation")
        ),
        .external(name: "FlexLayout"),
        .external(name: "PinLayout"),
      ]
    )
  ]
)
