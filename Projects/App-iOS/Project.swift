import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.appHost(
  name: "App-iOS",
  appTargetNames: ["App", "App_Impl"],
  extraDependencies: [
    .project(target: "AppContext_TabBar", path: "../AppContext/AppContext_TabBar"),
    .project(target: "Shared_Foundation", path: "../Shared/Shared_Foundation"),
    .external(name: "Swinject"),
  ]
)
