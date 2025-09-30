//
//  String+Extension.swift
//  Shared_Foundation
//
//  Created by 김동환 on 9/28/25.
//

import Foundation

extension String {
  public func toDate(format: String = "yyyy-MM-dd HH:mm") -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = .current
    return formatter.date(from: self)
  }
}
