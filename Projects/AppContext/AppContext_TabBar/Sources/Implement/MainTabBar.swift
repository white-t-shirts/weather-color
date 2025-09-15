//
//  MainTabBar.swift
//  AppContext_TabBar
//
//  Created by 김동환 on 9/13/25.
//

import ReactorKit
import RxSwift
import Pure

import UIKit

import Shared_Foundation

import AppContext_TabBar

final class MainTabBar: UIView, MainTabBarViewType, View, FactoryModule {

  // MARK: Module
  
  public struct Dependency {
  }
  
  public struct Payload {
  }
  
  
  // MARK: Properties

  var height: CGFloat = UIScreen.safeAreaInsets.bottom + MainTabBarButton.height
  var disposeBag = DisposeBag()

  private let dependency: Dependency
  private let payload: Payload


  // MARK: UI

  
  // MARK: Configure


  func bind(reactor: MainTabBarReactor) {

  }

  
  // MARK: Initialize
  
  public init(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
    self.payload = payload
    super.init(frame: .zero)
    self.configureLayerRadius()
    self.configureBorder()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: Layout
  
  private func configureLayerRadius() {
    self.layer.cornerRadius = 30
    self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    self.layer.masksToBounds = true
  }
  
  private func configureBorder() {
    self.layer.borderWidth = 0.3
    self.layer.borderColor = UIColor.lightGray.cgColor
  }
}
