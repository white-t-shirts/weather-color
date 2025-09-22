//
//  ObjectMapper+Rx.swift
//  AppCore_Network
//
//  Created by 김동환 on 9/22/25.
//

import RxSwift

extension PrimitiveSequenceType where Trait == SingleTrait, Element == Moya.Response {
  public func map<T: ImmutableMappable>(_ mappableType: T.Type) -> PrimitiveSequence<Trait, T> {
    return self.primitiveSequence.mapString()
      .map { jsonString -> T in
        return try Mapper<T>().map(JSONString: jsonString)
      }
      .do(onError: { error in
        print("❌ Mapping failed: \(error.localizedDescription)")
      })
  }

  public func map<T: ImmutableMappable>(_ mappableType: [T].Type) -> PrimitiveSequence<Trait, [T]> {
    return self.primitiveSequence.mapString()
      .map { jsonString -> [T] in
        return try Mapper<T>().mapArray(JSONString: jsonString)
      }
      .do(onError: { error in
        print("❌ Mapping failed: \(error.localizedDescription)")
      })
  }
}
