import ProjectDescription

let project = Project(
  name: "Shared_ReactiveX",
  targets: [
    Target.target(
      name: "Shared_ReactiveX",
      destinations: [.iPhone],
      product: .staticFramework,
      bundleId: "com.example.shared.reactive",
      deploymentTargets: .iOS("15.0"),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: [],
      dependencies: [
        .external(name: "RxSwift"),
        .external(name: "RxCocoa"),
        .external(name: "ReactorKit"),
        .external(name: "RxDataSources"),
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
