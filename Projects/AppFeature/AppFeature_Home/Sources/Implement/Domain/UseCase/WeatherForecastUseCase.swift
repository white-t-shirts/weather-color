//
//  WeatherForecastUseCase.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/26/25.

protocol WeatherForecastUseCase {
  func weatherForecast(query: String, days: Int) async throws -> WeatherForecast
}

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
