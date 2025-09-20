//
//  WeatherForecastResposeDTO.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/19/25.
//

import AppCore_Network

struct WeatherForecastResposeDTO: ImmutableMappable {
  let location: Location

  init(map: Map) throws {
    self.location = try map.value("location")
  }
}


// MARK: Location

struct Location: ImmutableMappable {
  let name: String
  let localTime: String

  init(map: Map) throws {
    self.name = try map.value("name")
    self.localTime = try map.value("localtime")
  }
}


// MARK: Current

struct Current: ImmutableMappable {
  let temp: Double
  let feelsLikeTemp: Double
  let isDay: Bool
  let uv: Double
  let humidity: Double
  let condition: Condition

  init(map: Map) throws {
    self.temp = try map.value("temp_c")
    self.feelsLikeTemp = try map.value("feelslike_c")
    let isDayFlag: Int = try map.value("is_day")
    self.isDay = (isDayFlag == 1)
    self.uv = try map.value("uv")
    self.humidity = try map.value("humidity")
    self.condition = try map.value("condition")
  }
}

struct Condition: ImmutableMappable {
  let text: String
  let code: Int

  init(map: Map) throws {
    self.text = try map.value("text")
    self.code = try map.value("code")
  }
}


// MARK: Forecast
