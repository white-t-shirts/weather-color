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

public final class MainTabBar: UIView, View, ConfiguratorModule {
  
  // MARK: Constant
  
  /// SafeArea 를 포함한 MainTabBar 의 height 값
  public static let tabBarHeight: CGFloat = MainTabBar.tabButtonHeight + UIScreen.safeAreaInsets.bottom
  /// MainTabBar 의 TabButton 의 height 값
  public static let tabButtonHeight: CGFloat = 40


  // MARK: Module
  
  public struct Dependency {
  }
  
  public struct Payload {
  }
  
  
  // MARK: Properties
  
  private var dependency: Dependency?
  private var payload: Payload?


  // MARK: UI

  
  // MARK: Configure
  
  public func configure(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
    self.payload = payload
  }
  
  
  // MARK: Initialize
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
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
