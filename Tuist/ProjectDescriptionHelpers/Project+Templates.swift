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
        appTargetName: String,
        extraDependencies: [TargetDependency] = []
    ) -> Project {
        Project(
            name: name,
            targets: [
                Target.target(
                    name: name,
                    destinations: appDestinations,
                    product: .app,
                    bundleId: "com.example.\(name)",
                    deploymentTargets: appDeployment,
                    infoPlist: .extendingDefault(with: [
                        "UILaunchScreen": [:],
                    ]),
                    sources: ["Sources/**"],        // AppDelegate 등 진입점만
                    resources: ["Resources/**"],    // Assets / InfoPlists 등
                    dependencies: extraDependencies + [
                        .project(target: appTargetName, path: "../App")
                    ]
                )
            ]
        )
    }
}
