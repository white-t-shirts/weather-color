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

  // MARK: Constant
  
  /// SafeArea 를 포함한 MainTabBar 의 height 값
  static let tabBarHeight: CGFloat = MainTabBar.tabButtonHeight + UIScreen.safeAreaInsets.bottom
  /// MainTabBar 의 TabButton 의 height 값
  static let tabButtonHeight: CGFloat = 40


  // MARK: Module
  
  public struct Dependency {
  }
  
  public struct Payload {
  }
  
  
  // MARK: Properties
  
  private let dependency: Dependency
  private let payload: Payload
  var height: CGFloat = UIScreen.safeAreaInsets.bottom + MainTabBar.tabButtonHeight
  var disposeBag = DisposeBag()


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
