//
//  MainTabBarController.swift
//  WeatherColor
//
//  Created by 김동환 on 8/16/25.
//

import Shared_Foundation

import AppCore_UI

import AppContext_TabBar

final class MainTabBarController: UITabBarController, FactoryModule {

  // MARK: Module
  
  struct Dependency {
    let tabBarFactory: MainTabBarViewFactory
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
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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
}
