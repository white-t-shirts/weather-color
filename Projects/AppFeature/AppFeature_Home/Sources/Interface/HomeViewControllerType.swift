//
//  HomeViewControllerType.swift
//  AppFeature_Home
//
//  Created by 김동환 on 9/19/25.
//

import AppCore_UI

@MainActor
public protocol HomeViewControllerType: ViewControllerType {
}

public struct HomeViewControllerFactoryType: ViewControllerFactoryType {
  public struct Payload {
    public init() {}
  }

  public var factoryClosure: FactoryClosure

  public init(_ factoryClosure: @escaping FactoryClosure) {
    self.factoryClosure = factoryClosure
  }
}
