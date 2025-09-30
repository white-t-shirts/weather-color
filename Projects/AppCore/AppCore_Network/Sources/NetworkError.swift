//
//  NetworkError.swift
//  AppCore_Network
//
//  Created by 김동환 on 9/26/25.
//

public enum APICallError: Error {
  case serverError
  case networkError
  case unknown
}
