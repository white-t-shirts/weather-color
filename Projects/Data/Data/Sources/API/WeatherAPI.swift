//
//  WeatherAPI.swift
//  Data
//
//  Created by 김동환 on 10/2/25.
//

import Shared_Foundation

import AppCore_Network

enum WeatherAPI {
  case forecast(query: String, days: Int)
}

extension WeatherAPI: TargetType {
  var baseURL: URL {
    URL(string: "https://api.weatherapi.com")!
  }

  var path: String {
    switch self {
    case .forecast:
      return "/v1/forecast.json"
    }
  }

  var method: Moya.Method {
    switch self {
    case .forecast:
      return .get
    }
  }

  var task: Moya.Task {
    switch self {
    case let .forecast(query, days):
      let parameters: [String: Any] = [
        "q": query,
        "key": PrivateKey.privateKey,
        "days": days
      ]
      return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
  }

  var headers: [String : String]? {
    nil
  }
}
