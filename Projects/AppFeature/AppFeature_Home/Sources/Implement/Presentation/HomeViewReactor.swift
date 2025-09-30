//
//  HomeViewReactor.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/18/25.
//

import Shared_Foundation
import Shared_ReactiveX

@MainActor
final class HomeViewReactor: @preconcurrency Reactor, @preconcurrency FactoryModule {

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
  }

  struct State {
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

      Single.create { try await self.dependency.repo.fetchWeather(query: "seoul", days: 1) }
        .asObservable()
        .flatMap { _ -> Observable<Mutation> in
          return .empty()
        }
        .catch { error -> Observable<Mutation> in
          return .empty()
        }

    }
    return .empty()
  }

  func reduce(state: State, mutation: Mutation) -> State {
    return State()
  }
}
