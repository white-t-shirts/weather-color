import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.appHost(
  name: "App-iOS",
  appTargetNames: ["App", "App_Impl"],
  extraDependencies: [
    .project(
      target: "AppFeature_Home_Impl",
      path: .relativeToRoot("Projects/AppFeature/AppFeature_Home")
    ),
    .project(
      target: "AppContext_TabBar_Impl",
      path: .relativeToRoot("Projects/AppContext/AppContext_TabBar")
    ),
    .project(
      target: "Shared_Foundation",
      path: .relativeToRoot("Projects/Shared/Shared_Foundation")
    ),
    .external(name: "Swinject"),
  ]
)
