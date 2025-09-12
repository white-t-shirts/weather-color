//
//  Resolver.swift
//  WeatherColor
//
//  Created by 김동환 on 9/12/25.
//

import Swinject

extension Resolver {
  public func resolve<Service>() -> Service! {
    return self.resolve(Service.self)
  }
}
