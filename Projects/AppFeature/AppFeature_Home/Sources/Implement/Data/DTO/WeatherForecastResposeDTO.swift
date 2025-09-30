//
//  WeatherForecastResposeDTO.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/19/25.
//

import Foundation

import AppCore_Network

struct WeatherForecastResposeDTO: ImmutableMappable {
  let location: LocationDTO
  let current: CurrentDTO
  let forecast: [ForecastDTO]

  init(map: Map) throws {
    self.location = try map.value("location")
    self.current = try map.value("current")
    self.forecast = try map.value("forecast.forecastday")
  }
}


// MARK: Location

struct LocationDTO: ImmutableMappable {
  let name: String
  let localTime: String

  init(map: Map) throws {
    self.name = try map.value("name")
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

//
//extension WeatherForecastResposeDTO {
//  func WeatherForecast() -> WeatherForecast {
////    let currentWeather: CurrentWeather = type(of: CurrentWeather(
////      temp: self.current.temp,
////      feelsLikeTemp: self.current.feelsLikeTemp,
////      condition: self.current.condition.text,
////      isDay: self.current.isDay,
////      uv: self.current.uv,
////      humidity: self.current.humidity
////    ))
//
//    let currentWeather = CurrentWeather(
//      temp: self.current.temp,
//      feelsLikeTemp: self.current.feelsLikeTemp,
//      condition: self.current.condition.text,
//      isDay: self.current.isDay,
//      uv: self.current.uv,
//      humidity: self.current.humidity
//    )
//
//    let dayForecast: DayForecast? = {
//      guard let dayForecastDTO = self.forecast.first?.day else { return nil }
//      let dayForecast: DayForecast = DayForecast(
//        maxTemp: dayForecastDTO.maxTemp,
//        averageTemp: dayForecastDTO.averageTemp,
//        minTemp: dayForecastDTO.minTemp,
//        willRain: dayForecastDTO.willRain,
//        chanceOfRain: dayForecastDTO.chanceOfRain,
//        willSnow: dayForecastDTO.willSnow,
//        chanceOfSnow: dayForecastDTO.chanceOfSnow,
//        averageHumidity: dayForecastDTO.averageHumidity,
//        uv: dayForecastDTO.uv
//      )
//      return dayForecast
//    }()
//
//    let hourForecasts: [HourForecast]? = {
//      guard let hourForecastDTOs = self.forecast.first?.hours else { return nil }
//
//      let forecasts = hourForecastDTOs.map { dto in
//        
//      }
//
//
//      return nil
//    }()
//
//
//
//
//    return WeatherForecast(
//      cityName: self.location.name,
//      localTime: self.location.localTime.toDate(),
//      currentWeather: currentWeather,
//      forecast: <#T##Forecast#>
//    )
//  }
//}
