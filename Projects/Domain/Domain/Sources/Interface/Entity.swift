//
//  Entity.swift
//  Domain
//
//  Created by 김동환 on 10/2/25.
//

import Foundation

public struct WeatherForecast {
  public let cityName: String
  public let localTime: Date?
  public let currentWeather: CurrentWeather
  public let forecast: Forecast

  public init(cityName: String, localTime: Date?, currentWeather: CurrentWeather, forecast: Forecast) {
    self.cityName = cityName
    self.localTime = localTime
    self.currentWeather = currentWeather
    self.forecast = forecast
  }
}

public struct CurrentWeather {
  public let temp: Double
  public let feelsLikeTemp: Double
  public let condition: String
  public let isDay: Bool
  public let uv: Double
  public let humidity: Double

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
  public let dayForecast: DayForecast
  public let hourForecasts: [HourForecast]

  public init(dayForecast: DayForecast, hourForecasts: [HourForecast]) {
    self.dayForecast = dayForecast
    self.hourForecasts = hourForecasts
  }
}

public struct DayForecast {
  public let maxTemp: Double
  public let averageTemp: Double
  public let minTemp: Double
  public let willRain: Bool
  public let chanceOfRain: Double
  public let willSnow: Bool
  public let chanceOfSnow: Double
  public let averageHumidity: Double
  public let uv: Double

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
  public let time: Date?
  public let temp: Double
  public let feelsLikeTemp: Double
  public let willRain: Bool
  public let chanceOfRain: Double
  public let willSnow: Bool
  public let chanceOfSnow: Double
  public let condition: String

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
