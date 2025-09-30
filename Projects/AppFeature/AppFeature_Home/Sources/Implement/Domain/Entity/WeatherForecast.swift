//
//  WeatherForecast.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/26/25.
//

import Foundation

struct WeatherForecast {
  let cityName: String
  let localTime: Date?
  let currentWeather: CurrentWeather
  let forecast: Forecast
}

struct CurrentWeather {
  let temp: Double
  let feelsLikeTemp: Double
  let condition: String
  let isDay: Bool
  let uv: Double
  let humidity: Double
}

struct Forecast {
  let dayForecast: DayForecast
  let hourForecasts: [HourForecast]
}

struct DayForecast {
  let maxTemp: Double
  let averageTemp: Double
  let minTemp: Double
  let willRain: Bool
  let chanceOfRain: Double
  let willSnow: Bool
  let chanceOfSnow: Double
  let averageHumidity: Double
  let uv: Double
}

struct HourForecast {
  let time: Date
  let temp: Double
  let feelsLikeTemp: Double
  let willRain: Bool
  let chanceOfRain: Double
  let willSnow: Bool
  let chanceOfSnow: Double
  let condition: String
}
