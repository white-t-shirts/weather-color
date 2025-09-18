//
//  MainTabBarControllerReactor.swift
//  App_Impl
//
//  Created by 김동환 on 9/19/25.
//

import Shared_Foundation
import Shared_ReactiveX

import AppContext_TabBar

final class MainTabBarControllerReactor: Reactor, FactoryModule {

  // MARK: Module

  struct Dependency {
  }

  struct Payload {
  }


  // MARK: Reactor

  enum Action {
    case selectTab(MainTabBarType)
  }

  enum Mutation {
    case setSelectedTabIndex(MainTabBarType)
  }

  struct State {
    @Pulse var selectedTabIndex: Int = 0
  }


  // MARK: Properties

  private let dependency: Dependency
  private let payload: Payload
  let initialState: State


  // MARK: Initialize

  init(dependency: Dependency, payload: Payload) {
    self.initialState = State()
    self.dependency = dependency
    self.payload = payload
  }


  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .selectTab(mainTabBarType):
      return .just(.setSelectedTabIndex(mainTabBarType))
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .setSelectedTabIndex(mainTabBarType):
      let selectedTabIndex = MainTabBarType.allCases.firstIndex(of: mainTabBarType) ?? 0
      newState.selectedTabIndex = selectedTabIndex
    }
    return newState
  }
}
