import ProjectDescription

private let appDestinations: Destinations = [.iPhone]
private let appDeployment: DeploymentTargets = .iOS("15.0")

public extension Project {
  /// 프레임워크(모듈) 템플릿
  static func appFramework(
    name: String,
    dependencies: [TargetDependency] = []
  ) -> Project {
    Project(
      name: name,
      targets: [
        Target.target(
          name: name,
          destinations: appDestinations,
          product: .framework,
          bundleId: "com.example.\(name)",
          deploymentTargets: appDeployment,
          infoPlist: .default,
          sources: ["Sources/**"],
          resources: ["Resources/**"],
          dependencies: dependencies
        )
      ]
    )
  }
  
  static func appHost(
    name: String,
    appTargetNames: [String],
    extraDependencies: [TargetDependency] = []
  ) -> Project {
    let appDependency = appTargetNames.map { TargetDependency.project(target: $0, path: "../App") }
    return Project(
      name: name,
      targets: [
        Target.target(
          name: name,
          destinations: appDestinations,
          product: .app,
          bundleId: "com.example.\(name)",
          deploymentTargets: appDeployment,
          infoPlist: .extendingDefault(with: ["UILaunchScreen": [:]]),
          sources: ["Sources/**"],
          resources: ["Resources/**"],
          dependencies: extraDependencies + appDependency,
          settings: .settings(base: [
            "OTHER_LDFLAGS": ["-ObjC"]
          ])
        )
      ]
    )
  }
}
