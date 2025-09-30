//
//  WeatherRepositoryImpl.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/19/25.
//

import _Concurrency   // 추가!

import Foundation

import Shared_ReactiveX

import AppCore_Network

final actor WeatherRepositoryImpl: WeatherRepository {
  private let provider: MoyaProvider<WeatherAPI>

  init(provider: MoyaProvider<WeatherAPI>) {
    self.provider = provider
  }

  func request() async -> Result<Moya.Response, MoyaError> {
    await withCheckedContinuation { [weak self] continuation in

      Task {

      }

      continuation.resume(returning: .success(.init(statusCode: 5, data: Data())))
//      provider.request(.forecast(query: "seoul", days: 1)) { result in
//        continuation.resume(returning: result)
//      }
    }
  }

//  func request(_ target: MoyaProvider) async -> Result<Moya.Response, MoyaError> {
//    await withCheckedContinuation { continuation in
//      self.request(target) { result in
//        continuation.resume(returning: result)
//      }
//    }
//  }

  func fetchWeather(query: String, days: Int) async throws -> WeatherForecastResposeDTO {
    let data = await self.request()
//
    switch data {
    case let .success(success):
      guard let data = try success.mapJSON() as? [String: Any] else { throw APICallError.unknown }
      return try Mapper<WeatherForecastResposeDTO>().map(JSON: data)

    case let .failure(failure):
      throw APICallError.unknown
    }
  }
}

//
//actor NetworkActor<T: TargetType> {
//  private let provider: MoyaProvider<T>
//  init(_ provider: MoyaProvider<T>) { self.provider = provider }
//
//  func request(_ target: T) async throws -> Moya.Response {
//    try await withCheckedThrowingContinuation { [weak self] cont in
//      self?.provider.request(target) { result in
//        switch result {
//        case .success(let r): cont.resume(returning: r)
//        case .failure(let e): cont.resume(throwing: e)
//        }
//      }
//    }
//  }
//}

final actor WeatherRepositoryImapl {
  private let provider: MoyaProvider<WeatherAPI>

  init(provider: MoyaProvider<WeatherAPI>) {
    self.provider = provider
  }

  func request() async throws -> Moya.Response {
    try await withCheckedThrowingContinuation { cont in
      // 비격리 클로저 안에서는 actor 상태에 접근하지 않음
      _Concurrency.Task { [weak self] in
        guard let self else { cont.resume(throwing: URLError(.cancelled)); return }
        await self._requestOnActor(cont)
      }
    }
  }

  // actor 격리된 메서드: 여기서는 provider 접근 OK
  private func _requestOnActor(_ cont: CheckedContinuation<Moya.Response, Error>) async {
    provider.request(.forecast(query: "seoul", days: 1)) { result in
      switch result {
      case .success(let r): cont.resume(returning: r)
      case .failure(let e): cont.resume(throwing: e)
      }
    }
  }
}


final actor WeatherRepositoryImepl {
  private let provider: MoyaProvider<WeatherAPI>

  init(provider: MoyaProvider<WeatherAPI>) {
    self.provider = provider
  }

  func request() async throws -> Moya.Response {
    return try await withCheckedThrowingContinuation { [weak self] cont in
      // 비격리 클로저 안에서는 actor 상태에 접근하지 않음
      _Concurrency.Task { [weak self] in
        guard let self else { cont.resume(throwing: URLError(.cancelled)); return }
        await self._requestOnActor(cont)
      }
    }
  }

  // actor 격리된 메서드: 여기서는 provider 접근 OK
  private func _requestOnActor(_ cont: CheckedContinuation<Moya.Response, Error>) {
    self.provider.request(.forecast(query: "seoul", days: 1)) { result in
      switch result {
      case .success(let r): cont.resume(returning: r)
      case .failure(let e): cont.resume(throwing: e)
      }
    }
  }
}
