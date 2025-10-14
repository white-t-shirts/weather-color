//
//  HomeViewReactor.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/18/25.
//

import Shared_Foundation
import Shared_ReactiveX

import Domain

final class HomeViewReactor: Reactor, FactoryModule, @unchecked Sendable {

  // MARK: Module

  struct Dependency {
    let weatherForecastUseCase: WeatherForecastUseCase
  }

  struct Payload {
  }


  // MARK: Reactor

  enum Action {
    case fetchWeather(cityName: String)
  }

  enum Mutation {
    case setWeatherForcast(WeatherForecast)
    case updateSections
  }

  struct State {
    var cityName: String?
    var mainTitle: String?
    var localTime: Date?

    var currentWeather: CurrentWeather?
    var forecast: Forecast?

    var homeViewSection: [HomeViewSection] = []
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
    case let .fetchWeather(cityName):
      return .concat([
        self.fetchWeatherForcast(cityName: cityName),
        .just(.updateSections)
      ])
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state

    switch mutation {
    case let .setWeatherForcast(weatherForecast):
      newState.cityName = weatherForecast.cityName
      newState.mainTitle = "Hello, there -\n\(weatherForecast.cityName) now"

      newState.localTime = weatherForecast.localTime

      newState.currentWeather = weatherForecast.currentWeather
      newState.forecast = weatherForecast.forecast

    case .updateSections:
      newState.homeViewSection = [
        self.mainTitleSection(state: state)
      ]
    }

    return newState
  }


  private func fetchWeatherForcast(cityName: String) -> Observable<Mutation> {
    Single.create { try await self.dependency.weatherForecastUseCase.weatherForecast(query: cityName, days: 1) }
      .asObservable()
      .map(Mutation.setWeatherForcast)
  }
}


// MARK: Section

extension HomeViewReactor {
  func mainTitleSection(state: State) -> HomeViewSection {
    let title = state.mainTitle ?? "Hello, there"
    return .init(identity: .title, items: [.title(text: title)])
  }
}
