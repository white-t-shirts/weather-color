//
//  MainTabBarController.swift
//  WeatherColor
//
//  Created by 김동환 on 8/16/25.
//

import Shared_Foundation

import AppCore_UI

import AppContext_TabBar

import AppFeature_Home
import AppFeature_Setting

final class MainTabBarController: UITabBarController, FactoryModule {

  // MARK: Module
  
  struct Dependency {
    let tabBarFactory: MainTabBarViewFactory
    let homeViewControllerFactory: HomeViewControllerFactoryType
    let settingViewControllerFactory: SettingViewControllerFactoryType
  }
  
  struct Payload {
  }
  
  
  // MARK: Properties
  
  private let dependency: Dependency
  private let payload: Payload
  
  
  // MARK: UI

  private lazy var tabBarView: MainTabBarViewType? = {
    return self.dependency.tabBarFactory.create(payload: .init()) as? MainTabBarViewType
  }()


  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
  }
  
  
  // MARK: Initialize
  
  init(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
    self.payload = payload
    super.init(nibName: nil, bundle: nil)
    self.tabBar.isHidden = true
    self.defineFlexContainer()
    self.setupViewControllers()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViewControllers() {
    let viewControllers = MainTabBarType.allCases.map { item -> UIViewController in
      switch item {
      case .home: return self.homeViewController() ?? UIViewController()
      case .setting: return self.settingViewController() ?? UIViewController()
      }
    }
    self.setViewControllers(viewControllers, animated: false)
  }

  
  // MARK: Layout
    
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.layoutFlexContainer()
  }
  
  private func defineFlexContainer() {
    guard let tabBar = self.tabBarView else { return }

    self.view.addSubview(tabBar)
  }
  
  private func layoutFlexContainer() {
    guard let tabBar = self.tabBarView else { return }

    tabBar.pin.horizontally()
      .bottom()
      .height(tabBar.height)
  }


  // MARK: ViewControllers

  private func homeViewController() -> HomeViewControllerType? {
    let viewController = self.dependency.homeViewControllerFactory.create(payload: .init(
    )) as? HomeViewControllerType
    return viewController
  }

  private func settingViewController() -> SettingViewControllerType? {
    let viewController = self.dependency.settingViewControllerFactory.create(payload: .init(
    )) as? SettingViewControllerType
    return viewController
  }
}
