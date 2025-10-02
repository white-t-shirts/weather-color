//
//  WeatherRepositoryImpl.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/19/25.
//

import Shared_ReactiveX

import AppCore_Network

import Domain

final class WeatherRepositoryImpl: WeatherRepository {

  private let provider: MoyaProvider<WeatherAPI>

  init(provider: MoyaProvider<WeatherAPI>) {
    self.provider = provider
  }

  func weatherForecast(query: String, days: Int) async throws -> WeatherForecast {
    let data = await self.provider.request(.forecast(query: query, days: days))

    switch data {
    case .success(let success):
      guard let jsonData = try success.mapJSON() as? [String: Any] else { throw APICallError.jsonMappingError }
      let dto = try Mapper<WeatherForecastResposeDTO>().map(JSON: jsonData)
      guard let forecast = dto.weatherForecast() else { throw APICallError.entityMappingError }
      return forecast

    case .failure:
      throw APICallError.networkError
    }
  }
}
