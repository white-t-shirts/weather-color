import ProjectDescription

let project = Project(
  name: "Shared_Foundation",
  targets: [
    Target.target(
      name: "Shared_Foundation",
      destinations: [.iPhone],
      product: .staticFramework,
      bundleId: "com.example.shared.foundation",
      deploymentTargets: .iOS("15.0"),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: [],
      dependencies: [
        .external(name: "Swinject"),
        .external(name: "Then"),
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
