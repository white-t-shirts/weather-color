//
//  WeatherForecastRepository.swift
//  Domain
//
//  Created by 김동환 on 10/2/25.
//

public protocol WeatherRepository {
  func weatherForecast(query: String, days: Int) async throws -> WeatherForecast
}
