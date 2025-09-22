//
//  RxMoya+Extension.swift
//  AppCore_Network
//
//  Created by 김동환 on 9/22/25.
//

import Shared_ReactiveX

extension PrimitiveSequence where Trait == SingleTrait {
  public func value() async throws -> Element {
    let holder = SerialDisposable()

    return try await withTaskCancellationHandler {
      try await withCheckedThrowingContinuation { continuation in
        let disposable = self.subscribe(
          onSuccess: { continuation.resume(returning: $0) },
          onFailure: { continuation.resume(throwing: $0) }
        )
        holder.disposable = disposable
      }
    } onCancel: {
      holder.dispose()
    }
  }
}
