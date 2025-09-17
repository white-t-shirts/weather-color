//
//  TabBarAssembly.swift
//  AppContext_TabBar
//
//  Created by 김동환 on 9/13/25.
//

import Swinject

import Pure

import AppContext_TabBar

public final class TabBarAssembly: Assembly {
  public init() {}
  
  public func assemble(container: Container) {
    let funcs: [(Container) -> Void] = [
      self.registerTabBar,
    ]
    funcs.forEach { $0(container) }
  }
}

private extension TabBarAssembly {
  private func registerTabBar(container: Container) {
    let resolver = container.synchronize()
    container.register(MainTabBarButton.Configurator.self) { _ in
      return MainTabBarButton.Configurator(dependency: .init(
      ))
    }

    container.register(MainTabBar.Factory.self) { _ in
      return MainTabBar.Factory(dependency: .init(
        buttonConfigurator: resolver.resolve()
      ))
    }

    container.register(MainTabBarReactor.Factory.self) { _ in
      return MainTabBarReactor.Factory(dependency: .init())
    }

    container.register(MainTabBarViewFactory.self) { _ in
      let tabBarFactory: MainTabBar.Factory = resolver.resolve()
      let tabBarReactorFactory: MainTabBarReactor.Factory = resolver.resolve()
      return MainTabBarViewFactory { payload in
        tabBarFactory.create(payload: .init(
          reactor: tabBarReactorFactory.create(payload: .init())
        ))
      }
    }
  }
}
