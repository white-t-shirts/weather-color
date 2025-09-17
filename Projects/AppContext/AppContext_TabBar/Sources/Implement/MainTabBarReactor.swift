//
//  MainTabBarReactor.swift
//  AppContext_TabBar
//
//  Created by 김동환 on 9/14/25.
//

import ReactorKit

import Shared_Foundation

import AppContext_TabBar

final class MainTabBarReactor: Reactor, FactoryModule {

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
    case setSelctedTab(MainTabBarType)
  }

  struct State {
    @Pulse var selectedTab: MainTabBarType = .home
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
    case let .selectTab(selectedTab):
      return .just(.setSelctedTab(selectedTab))
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .setSelctedTab(selectedTab):
      newState.selectedTab = selectedTab
    }
    return newState
  }
}
