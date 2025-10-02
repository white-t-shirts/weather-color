//
//  HomeViewReactor.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/18/25.
//

import Shared_Foundation
import Shared_ReactiveX

final class HomeViewReactor: Reactor, FactoryModule, @unchecked Sendable {

  // MARK: Module

  struct Dependency {
    let repo: WeatherRepository
  }

  struct Payload {
  }


  // MARK: Reactor

  enum Action {
    case fetchWeather
  }

  enum Mutation {
    case setDTO(WeatherForecastResposeDTO?)
  }

  struct State {
    var dto: WeatherForecastResposeDTO?
  }


  // MARK: Properties

  private let dependency: Dependency
  private let payload: Payload
  let initialState: State

  init(dependency: Dependency, payload: Payload) {
    self.initialState = State()
    self.dependency = dependency
    self.payload = payload
  }


  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .fetchWeather:

      return Single.create { try await self.dependency.repo.weatherForecast(query: "seoul", days: 1) }
        .asObservable()
        .flatMap { ss -> Observable<Mutation> in
          print(ss)
          return .empty()
        }
        .catch { error -> Observable<Mutation> in
          return .just(.setDTO(nil))
        }

    }
    return .empty()
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .setDTO(dto):
      print(dto)
      newState.dto = dto
    }
    return newState
  }
}
