//
//  WeatherRepository.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/23/25.
//

import AppCore_Network

protocol WeatherRepository: Sendable {
  func fetchWeather(query: String, days: Int) async throws -> WeatherForecastResposeDTO
}
