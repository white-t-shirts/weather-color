//
//  SettingAssembly.swift
//  AppFeature_Setting
//
//  Created by 김동환 on 9/18/25.
//

import Shared_Foundation

import AppFeature_Setting

public final class SettingAssembly: Assembly {
  public init() {}

  public func assemble(container: Container) {
    let funcs: [(Container) -> Void] = [
      self.registerSetting,
    ]
    funcs.forEach { $0(container) }
  }
}

private extension SettingAssembly {
  private func registerSetting(container: Container) {
    let resolver = container.synchronize()

    container.register(SettingViewReactor.Factory.self) { _ in
      return SettingViewReactor.Factory(dependency: .init(
      ))
    }
    container.register(SettingViewController.Factory.self) { _ in
      return SettingViewController.Factory(dependency: .init(
      ))
    }
    container.register(SettingViewControllerFactoryType.self) { _ in
      let viewControllerFactory: SettingViewController.Factory = resolver.resolve()
      let reactorFactory: SettingViewReactor.Factory = resolver.resolve()
      return SettingViewControllerFactoryType { payload in
        return viewControllerFactory.create(payload: .init(
          reactor: reactorFactory.create(payload: .init())
        ))
      }
    }
  }
}
