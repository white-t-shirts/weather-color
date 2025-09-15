//
//  MainTabBarViewType.swift
//  AppContext_TabBar
//
//  Created by 김동환 on 9/15/25.
//

import AppCore_UI

public protocol MainTabBarViewType: ViewType {
  var height: CGFloat { get }
}


public struct MainTabBarViewFactory: ViewFactoryType {
  public struct Payload {
    public init() {}
  }

  public var factoryClosure: FactoryClosure

  public init(_ factoryClosure: @escaping FactoryClosure) {
    self.factoryClosure = factoryClosure
  }
}
