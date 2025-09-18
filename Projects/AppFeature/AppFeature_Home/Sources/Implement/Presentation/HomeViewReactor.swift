//
//  HomeViewReactor.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/18/25.
//

import Shared_ReactiveX
import Shared_Foundation

final class HomeViewReactor: Reactor, FactoryModule {

  // MARK: Module

  struct Dependency {
  }

  struct Payload {
  }


  // MARK: Reactor

  enum Action {
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
    return .empty()
  }

  func reduce(state: State, mutation: Mutation) -> State {
    return State()
  }
}
