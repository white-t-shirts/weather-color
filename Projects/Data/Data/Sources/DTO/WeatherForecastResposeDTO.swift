//
//  WeatherForecastResposeDTO.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/19/25.
//

import Shared_Foundation

import AppCore_Network

import Domain

struct WeatherForecastResposeDTO: ImmutableMappable {
  let locationDTO: LocationDTO
  let currentDTO: CurrentDTO
  let forecastDTO: [ForecastDTO]

  init(map: Map) throws {
    self.locationDTO = try map.value("location")
    self.currentDTO = try map.value("current")
    self.forecastDTO = try map.value("forecast.forecastday")
  }
}


// MARK: Location

struct LocationDTO: ImmutableMappable {
  let cityName: String
  let localTime: String

  init(map: Map) throws {
    self.cityName = try map.value("name")
    self.localTime = try map.value("localtime")
  }
}


// MARK: Current

struct CurrentDTO: ImmutableMappable {
  let temp: Double
  let feelsLikeTemp: Double
  let isDay: Bool
  let uv: Double
  let humidity: Double
  let condition: ConditionDTO

  init(map: Map) throws {
    self.temp = try map.value("temp_c")
    self.feelsLikeTemp = try map.value("feelslike_c")
    self.isDay = try map.value("is_day")
    self.uv = try map.value("uv")
    self.humidity = try map.value("humidity")
    self.condition = try map.value("condition")
  }
}

struct ConditionDTO: ImmutableMappable {
  let text: String
  let code: Int

  init(map: Map) throws {
    self.text = try map.value("text")
    self.code = try map.value("code")
  }
}


// MARK: Forecast

struct ForecastDTO: ImmutableMappable {
  let day: DayForecastDTO
  let hours: [HourForecastDTO]

  init(map: Map) throws {
    self.day = try map.value("day")
    self.hours = try map.value("hour")
  }
}

struct DayForecastDTO: ImmutableMappable {
  let maxTemp: Double
  let averageTemp: Double
  let minTemp: Double
  let willRain: Bool
  let chanceOfRain: Double
  let willSnow: Bool
  let chanceOfSnow: Double
  let averageHumidity: Double
  let uv: Double

  init(map: Map) throws {
    self.maxTemp = try map.value("maxtemp_c")
    self.averageTemp = try map.value("avgtemp_c")
    self.minTemp = try map.value("mintemp_c")
    self.willRain = try map.value("daily_will_it_rain")
    self.chanceOfRain = try map.value("daily_chance_of_rain")
    self.willSnow = try map.value("daily_will_it_snow")
    self.chanceOfSnow = try map.value("daily_chance_of_snow")
    self.averageHumidity = try map.value("avghumidity")
    self.uv = try map.value("uv")
  }
}

struct HourForecastDTO: ImmutableMappable {
  let time: String
  let temp: Double
  let feelsLikeTemp: Double
  let willRain: Bool
  let chanceOfRain: Double
  let willSnow: Bool
  let chanceOfSnow: Double
  let condition: String

  init(map: Map) throws {
    self.time = try map.value("time")
    self.temp = try map.value("temp_c")
    self.feelsLikeTemp = try map.value("feelslike_c")
    self.willRain = try map.value("will_it_rain")
    self.chanceOfRain = try map.value("chance_of_rain")
    self.willSnow = try map.value("will_it_snow")
    self.chanceOfSnow = try map.value("chance_of_snow")
    self.condition = try map.value("condition.text")
  }
}


// MARK: DTO -> Entity

extension WeatherForecastResposeDTO {
  func weatherForecast() -> WeatherForecast? {
    let currentWeather = self.currentWeather()
    guard let dayForecast = self.dayForecast() else { return nil }
    guard let hourForecast = self.hourForecast() else { return nil }
    let forecast = Forecast(dayForecast: dayForecast, hourForecasts: hourForecast)

    return WeatherForecast(
      cityName: self.locationDTO.cityName,
      localTime: self.locationDTO.localTime.toDate(),
      currentWeather: currentWeather,
      forecast: forecast
    )
  }

  private func currentWeather() -> CurrentWeather {
    return CurrentWeather(
      temp: self.currentDTO.temp,
      feelsLikeTemp: self.currentDTO.feelsLikeTemp,
      condition: self.currentDTO.condition.text,
      isDay: self.currentDTO.isDay,
      uv: self.currentDTO.uv,
      humidity: self.currentDTO.humidity
    )
  }

  private func dayForecast() -> DayForecast? {
    guard let dayForecastDTO = self.forecastDTO.first?.day else { return nil }
    return DayForecast(
      maxTemp: dayForecastDTO.maxTemp,
      averageTemp: dayForecastDTO.averageTemp,
      minTemp: dayForecastDTO.minTemp,
      willRain: dayForecastDTO.willRain,
      chanceOfRain: dayForecastDTO.chanceOfRain,
      willSnow: dayForecastDTO.willSnow,
      chanceOfSnow: dayForecastDTO.chanceOfRain,
      averageHumidity: dayForecastDTO.averageHumidity,
      uv: dayForecastDTO.uv
    )
  }

  private func hourForecast() -> [HourForecast]? {
    guard let hourForecastDTO = self.forecastDTO.first?.hours else { return nil }
    let hourForecast: [HourForecast] = hourForecastDTO.map { dto -> HourForecast in
      return HourForecast(
        time: dto.time.toDate(),
        temp: dto.temp,
        feelsLikeTemp: dto.feelsLikeTemp,
        willRain: dto.willRain,
        chanceOfRain: dto.chanceOfRain,
        willSnow: dto.willSnow,
        chanceOfSnow: dto.chanceOfSnow,
        condition: dto.condition
      )
    }
    return hourForecast
  }
}
