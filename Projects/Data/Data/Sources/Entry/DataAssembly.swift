//
//  DataAssembly.swift
//  Data
//
//  Created by 김동환 on 10/2/25.
//

import Shared_Foundation

import AppCore_Network

import Domain

@MainActor
public final class DataAssembly: @preconcurrency Assembly {
  public init() {}

  public func assemble(container: Container) {
    let funcs: [(Container) -> Void] = [
      self.registerRepository,
      self.registerApiProvider,
    ]
    funcs.forEach { $0(container) }
  }
}

private extension DataAssembly {
  private func registerRepository(container: Container) {
    let resolver = container.synchronize()
    container.register(WeatherRepository.self) { _ in
      WeatherRepositoryImpl(provider: resolver.resolve())
    }
  }

  private func registerApiProvider(container: Container) {
    container.register(MoyaProvider<WeatherAPI>.self) { _ in
      MoyaProvider<WeatherAPI>()
    }
  }
}
