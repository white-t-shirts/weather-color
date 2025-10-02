//
//  WeatherForcastUseCase.swift
//  Domain
//
//  Created by 김동환 on 10/2/25.
//

public protocol WeatherForecastUseCase {
  func weatherForecast(query: String, days: Int) async throws -> WeatherForecast
}
