//
//  RxMoya+Extension.swift
//  AppCore_Network
//
//  Created by 김동환 on 9/22/25.
//

import Moya

// Repository 개발 시 Moya 를 Swift Concurrency 기반으로 사용할 때 활용
// 이를 Single.create 로 wrapping 해 사용
public extension MoyaProvider {
  func request(_ target: Target) async -> Result<Moya.Response, MoyaError> {
    await withCheckedContinuation { continuation in
      self.request(target) { result in
        continuation.resume(returning: result)
      }
    }
  }
}

extension Moya.Response: @unchecked @retroactive Sendable {}
extension MoyaError: @unchecked Sendable {}
