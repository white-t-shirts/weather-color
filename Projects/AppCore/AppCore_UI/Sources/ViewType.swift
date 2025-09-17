//
//  ViewType.swift
//  AppCore_UI
//
//  Created by 김동환 on 9/14/25.
//

import UIKit

public protocol ViewType where Self: UIView {}

public protocol ViewFactoryType {
  associatedtype Payload

  typealias FactoryClosure = (Payload) -> ViewType

  var factoryClosure: FactoryClosure { get }

  func create(payload: Payload) -> ViewType
}

public extension ViewFactoryType {
  func create(payload: Payload) -> ViewType {
    return self.factoryClosure(payload)
  }
}
