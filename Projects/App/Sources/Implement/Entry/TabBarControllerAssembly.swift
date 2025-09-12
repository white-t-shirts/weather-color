//
//  TabBarControllerAssembly.swift
//  App
//
//  Created by 김동환 on 9/11/25.
//

import Shared_Foundation

import App

public final class TabBarControllerAssembly: Assembly {
  public init() {}
  
  public func assemble(container: Container) {
    let funcs: [(Container) -> Void] = [
      self.registerMainTabBarController,
      self.registerAppStarter,
    ]
    funcs.forEach { $0(container) }
  }
}

private extension TabBarControllerAssembly {
  private func registerMainTabBarController(container: Container) {
    container.register(MainTabBarController.Factory.self) { _ in
      MainTabBarController.Factory(dependency: .init())
    }
  }
  
  private func registerAppStarter(container: Container) {
    let resolver = container.synchronize()
    container.register(AppStarter.self) { _ in
      return AppStarterImpl(tabBarControllerFactory: resolver.resolve())
    }
  }
}
