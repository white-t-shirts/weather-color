//
//  HomeAssembly.swift
//  AppFeature_Home
//
//  Created by 김동환 on 9/18/25.
//

import Shared_Foundation

import AppCore_Network

import AppFeature_Home

@MainActor
public final class HomeAssembly: @preconcurrency Assembly {
  public init() {}

  public func assemble(container: Container) {
    let funcs: [(Container) -> Void] = [
      self.registerHome,
    ]
    funcs.forEach { $0(container) }
  }
}

private extension HomeAssembly {
  private func registerHome(container: Container) {
    let resolver = container.synchronize()

    container.register(HomeViewReactor.Factory.self) { _ in
      return HomeViewReactor.Factory(dependency: .init(
        weatherForecastUseCase: resolver.resolve()
      ))
    }
    container.register(HomeViewController.Factory.self) { _ in
      return HomeViewController.Factory(dependency: .init(
      ))
    }
    container.register(HomeViewControllerFactoryType.self) { _ in
      let viewControllerFactory: HomeViewController.Factory = resolver.resolve()
      let reactorFactory: HomeViewReactor.Factory = resolver.resolve()
      return HomeViewControllerFactoryType { payload in
        return viewControllerFactory.create(payload: .init(
          reactor: reactorFactory.create(payload: .init())
        ))
      }
    }
  }
}
