//
//  WeatherForecastUseCaseImpl.swift
//  Domain_Impl
//
//  Created by 김동환 on 10/2/25.
//

import Domain

final class WeatherForecastUseCaseImpl: WeatherForecastUseCase {
  private let weatherRepository: WeatherRepository

  init(weatherRepository: WeatherRepository) {
    self.weatherRepository = weatherRepository
  }

  func weatherForecast(query: String, days: Int) async throws -> WeatherForecast {
    let forecast = try await self.weatherRepository.weatherForecast(query: query, days: days)
    return forecast
  }
}
