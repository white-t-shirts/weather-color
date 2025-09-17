//
//  AppStarterImpl.swift
//  WeatherColor
//
//  Created by 김동환 on 8/16/25.
//

import AppCore_UI

import App

final class AppStarterImpl: AppStarter {
  
  private let tabBarControllerFactory: MainTabBarController.Factory
  
  init(tabBarControllerFactory: MainTabBarController.Factory) {
    self.tabBarControllerFactory = tabBarControllerFactory
  }
  
  func start(in window: UIWindow) {
    let tabBarController = self.tabBarControllerFactory.create(payload: .init())
    let root = UINavigationController(rootViewController: tabBarController)
    window.rootViewController = root
  }
}
