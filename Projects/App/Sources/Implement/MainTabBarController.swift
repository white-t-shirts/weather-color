//
//  MainTabBarController.swift
//  WeatherColor
//
//  Created by 김동환 on 8/16/25.
//

import PinLayout
import Pure

import UIKit

import Shared_Foundation

import AppContext_TabBar

final class MainTabBarController: UIViewController, FactoryModule {
  
  // MARK: Module
  
  struct Dependency {
  }
  
  struct Payload {
  }
  
  
  // MARK: Properties
  
  private let dependency: Dependency
  private let payload: Payload
  
  
  // MARK: UI
  
  private let tabBar = MainTabBar()
  
  
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
    self.view.addSubview(self.tabBar)
  }
  
  private func layoutFlexContainer() {
    self.tabBar.pin.horizontally()
      .bottom()
      .height(MainTabBar.tabBarHeight)
  }
}
