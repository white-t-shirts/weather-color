//
//  Entity.swift
//  Domain
//
//  Created by 김동환 on 10/2/25.
//

import Foundation

public struct WeatherForecast {
  let cityName: String
  let localTime: Date?
  let currentWeather: CurrentWeather
  let forecast: Forecast

  public init(cityName: String, localTime: Date?, currentWeather: CurrentWeather, forecast: Forecast) {
    self.cityName = cityName
    self.localTime = localTime
    self.currentWeather = currentWeather
    self.forecast = forecast
  }
}

public struct CurrentWeather {
  let temp: Double
  let feelsLikeTemp: Double
  let condition: String
  let isDay: Bool
  let uv: Double
  let humidity: Double

  public init(temp: Double, feelsLikeTemp: Double, condition: String, isDay: Bool, uv: Double, humidity: Double) {
    self.temp = temp
    self.feelsLikeTemp = feelsLikeTemp
    self.condition = condition
    self.isDay = isDay
    self.uv = uv
    self.humidity = humidity
  }
}

public struct Forecast {
  let dayForecast: DayForecast
  let hourForecasts: [HourForecast]

  public init(dayForecast: DayForecast, hourForecasts: [HourForecast]) {
    self.dayForecast = dayForecast
    self.hourForecasts = hourForecasts
  }
}

public struct DayForecast {
  let maxTemp: Double
  let averageTemp: Double
  let minTemp: Double
  let willRain: Bool
  let chanceOfRain: Double
  let willSnow: Bool
  let chanceOfSnow: Double
  let averageHumidity: Double
  let uv: Double

  public init(
    maxTemp: Double,
    averageTemp: Double,
    minTemp: Double,
    willRain: Bool,
    chanceOfRain: Double,
    willSnow: Bool,
    chanceOfSnow: Double,
    averageHumidity: Double,
    uv: Double
  ) {
    self.maxTemp = maxTemp
    self.averageTemp = averageTemp
    self.minTemp = minTemp
    self.willRain = willRain
    self.chanceOfRain = chanceOfRain
    self.willSnow = willSnow
    self.chanceOfSnow = chanceOfSnow
    self.averageHumidity = averageHumidity
    self.uv = uv
  }
}

public struct HourForecast {
  let time: Date?
  let temp: Double
  let feelsLikeTemp: Double
  let willRain: Bool
  let chanceOfRain: Double
  let willSnow: Bool
  let chanceOfSnow: Double
  let condition: String

  public init(
    time: Date?,
    temp: Double,
    feelsLikeTemp: Double,
    willRain: Bool,
    chanceOfRain: Double,
    willSnow: Bool,
    chanceOfSnow: Double,
    condition: String
  ) {
    self.time = time
    self.temp = temp
    self.feelsLikeTemp = feelsLikeTemp
    self.willRain = willRain
    self.chanceOfRain = chanceOfRain
    self.willSnow = willSnow
    self.chanceOfSnow = chanceOfSnow
    self.condition = condition
  }
}
