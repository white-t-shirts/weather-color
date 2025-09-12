//
//  MainTabBarController.swift
//  WeatherColor
//
//  Created by 김동환 on 8/16/25.
//

import Pure

import UIKit

final class MainTabBarController: UIViewController, FactoryModule {
  
  struct Dependency {
  }
  
  struct Payload {
  }
  
  private let dependency: Dependency
  private let payload: Payload
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
  }
  
  init(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
    self.payload = payload
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
