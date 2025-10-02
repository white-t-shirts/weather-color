//
//  DomainAssembly.swift
//  Domain
//
//  Created by 김동환 on 10/2/25.
//

import Shared_Foundation

import Domain

@MainActor
public final class DomainAssembly: @preconcurrency Assembly {
  public init() {}

  public func assemble(container: Container) {
    let funcs: [(Container) -> Void] = [
      self.registerUseCase,
    ]
    funcs.forEach { $0(container) }
  }
}

private extension DomainAssembly {
  private func registerUseCase(container: Container) {
    let resolver = container.synchronize()
    container.register(WeatherForecastUseCase.self) { _ in
      WeatherForecastUseCaseImpl(
        weatherRepository: resolver.resolve()
      )
    }
  }
}
