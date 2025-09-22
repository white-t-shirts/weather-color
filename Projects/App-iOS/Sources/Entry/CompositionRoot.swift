//
//  CompositionRoot.swift
//  App-iOS
//
//  Created by 김동환 on 9/11/25.
//

import Shared_Foundation

import App
import App_Impl

import AppContext_TabBar_Impl

import AppFeature_Home_Impl
import AppFeature_Setting_Impl

struct AppDependency {
  let appStarter: AppStarter
}

@MainActor
enum CompositionRoot {
  fileprivate static var container: Container = Container(defaultObjectScope: .container)
  
  static func resolve() -> AppDependency {
    let assemblies: [Assembly] = [
      App_Impl.TabBarControllerAssembly(),
      AppFeature_Home_Impl.HomeAssembly(),
      AppFeature_Setting_Impl.SettingAssembly(),
      AppContext_TabBar_Impl.TabBarAssembly(),
    ]
    _ = Assembler(assemblies, container: self.container)
    let resolver = self.container.synchronize()
    return AppDependency(
      appStarter: resolver.resolve()
    )
  }
}
