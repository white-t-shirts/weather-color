//
//  TabBarControllerAssembly.swift
//  App
//
//  Created by 김동환 on 9/11/25.
//

import Swinject

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
    let resolver = container.synchronize()
    container.register(MainTabBarController.Factory.self) { _ in
      MainTabBarController.Factory(dependency: .init(
        tabBarFactory: resolver.resolve(),
        homeViewControllerFactory: resolver.resolve(),
        settingViewControllerFactory: resolver.resolve()
      ))
    }
  }
  
  private func registerAppStarter(container: Container) {
    let resolver = container.synchronize()
    container.register(AppStarter.self) { _ in
      return AppStarterImpl(tabBarControllerFactory: resolver.resolve())
    }
  }
}
