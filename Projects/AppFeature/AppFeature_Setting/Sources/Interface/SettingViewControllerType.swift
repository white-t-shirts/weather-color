//
//  SettingViewControllerType.swift
//  AppFeature_Setting
//
//  Created by 김동환 on 9/19/25.
//

import AppCore_UI

public protocol SettingViewControllerType: ViewControllerType {
}

public struct SettingViewControllerFactoryType: ViewControllerFactoryType {
  public struct Payload {
    public init() {}
  }

  public var factoryClosure: FactoryClosure

  public init(_ factoryClosure: @escaping FactoryClosure) {
    self.factoryClosure = factoryClosure
  }
}
