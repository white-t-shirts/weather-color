//
//  WeatherRepository.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/23/25.
//

protocol WeatherRepository {
  func weatherForecast(query: String, days: Int) async throws -> WeatherForecast
}
