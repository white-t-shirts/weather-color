import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.appHost(
  name: "App-iOS",
  appTargetNames: ["App", "App_Impl"],
  extraDependencies: [
    .external(name: "Swinject"),
  ]
)
