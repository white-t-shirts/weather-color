//
//  TabBarAssembly.swift
//  AppContext_TabBar
//
//  Created by 김동환 on 9/13/25.
//

import Shared_Foundation

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
    container.register(MainTabBar.Configurator.self) { _ in
      MainTabBar.Configurator(dependency: .init())
    }
  }
}
