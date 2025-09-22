//
//  WeatherRepositoryImpl.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/19/25.
//

import Shared_ReactiveX

import AppCore_Network

final class WeatherRepositoryImpl {
  let provider: MoyaProvider<WeatherAPI>

  init(provider: MoyaProvider<WeatherAPI>) {
    self.provider = provider
  }
}

extension WeatherRepositoryImpl {
  func fetchWeather() async {
    do {
      let a = try await self.provider.rx.request(.forecast(q: "seoul", days: 1))
        .filterSuccessfulStatusCodes()
        .map(WeatherForecastResposeDTO.self)

      print(a)

    } catch {
      print(error)
    }
  }
}
