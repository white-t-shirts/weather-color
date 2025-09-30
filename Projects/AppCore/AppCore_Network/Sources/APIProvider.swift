//
//  APIProvider.swift
//  AppCore_Network
//
//  Created by 김동환 on 9/28/25.
//

import Moya

// MoyaProvider+Rx 용
public protocol APIProviderType: MoyaProviderType {}

public final class APIProvider<T: TargetType>: MoyaProvider<T>, APIProviderType {
}

public extension APIProvider {
  func requestWithValidation(_ token: Target) async -> Result<Response, Error> {
    let result = await self.request(token)

    switch result {
    case .success(let response):
      return .success(response)

    case .failure(let error):
      return .failure(error)
    }
  }
}
