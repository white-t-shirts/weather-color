//
//  AppStarterImpl.swift
//  WeatherColor
//
//  Created by 김동환 on 8/16/25.
//

import AppCore_UI

import App

@MainActor
final class AppStarterImpl: AppStarter {
  
  private let tabBarControllerFactory: MainTabBarController.Factory
  private let tabBarControllerReactorFactory: MainTabBarControllerReactor.Factory

  init(
    tabBarControllerFactory: MainTabBarController.Factory,
    tabBarControllerReactorFactory: MainTabBarControllerReactor.Factory
  ) {
    self.tabBarControllerFactory = tabBarControllerFactory
    self.tabBarControllerReactorFactory = tabBarControllerReactorFactory
  }
  
  func start(in window: UIWindow) {
    let reactor = self.tabBarControllerReactorFactory.create(payload: .init())
    let tabBarController = self.tabBarControllerFactory.create(payload: .init(
      reactor: reactor
    ))
    window.rootViewController = tabBarController
  }
}
