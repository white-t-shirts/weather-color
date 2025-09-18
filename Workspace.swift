import ProjectDescription

let workspace = Workspace(
  name: "WeatherColor",
  projects: [
    "Projects/App-iOS",
    "Projects/App",
    "Projects/AppFeature/**",
    "Projects/AppContext/**",
    "Projects/AppCore/**",
    "Projects/Shared/**",
  ]
)
