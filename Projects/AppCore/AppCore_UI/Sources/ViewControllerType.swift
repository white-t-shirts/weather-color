//
//  ViewControllerType.swift
//  AppCore_UI
//
//  Created by 김동환 on 9/19/25.
//

import UIKit

public protocol ViewControllerType where Self: UIViewController {}

/// 추상화 된 ViewController 를 생성하기 위한 추상 팩토리 타입
public protocol ViewControllerFactoryType {

  /// ViewController 를 생성하는 데 필요한 런타임 파라미터
  associatedtype Payload

  /// 런타임 파라미터를 받아 ViewController 를 생성하는 클로저
  typealias FactoryClosure = (Payload) -> ViewControllerType

  var factoryClosure: FactoryClosure { get }

  /// ViewControllerType 생성 인터페이스
  func create(payload: Payload) -> ViewControllerType
}

public extension ViewControllerFactoryType {
  func create(payload: Payload) -> ViewControllerType {
    return self.factoryClosure(payload)
  }
}
