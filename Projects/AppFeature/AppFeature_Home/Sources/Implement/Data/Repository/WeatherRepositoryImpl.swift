//
//  WeatherRepositoryImpl.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/19/25.
//

import Shared_ReactiveX
import AppCore_Network
import Foundation
import Moya

final class WeatherRepositoryImpl {
  let provider: MoyaProvider<WeatherAPI>

  init(provider: MoyaProvider<WeatherAPI>) {
    self.provider = provider
  }
}

extension WeatherRepositoryImpl {
  
}
