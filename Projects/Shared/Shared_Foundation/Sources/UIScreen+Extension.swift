//
//  UIScreen+Extension.swift
//  Shared_Foundation
//
//  Created by 김동환 on 9/13/25.
//

import UIKit

public extension UIScreen {
  static var safeAreaInsets: UIEdgeInsets {
    guard let rootWindow = self.rootWindow() else {
      return self.defaultSafeAreaInsets()
    }
    
    return .init(
      top: rootWindow.safeAreaInsets.top,
      left: rootWindow.safeAreaInsets.left,
      bottom: rootWindow.safeAreaInsets.bottom,
      right: rootWindow.safeAreaInsets.right
    )
  }
  
  static var screenSize: CGSize {
    return self.main.bounds.size
  }
  
  private static func rootWindow() -> RootWindow? {
    return UIApplication.shared.currentWindows.first(where: { $0.isRootWindow() }) as? RootWindow
  }
  
  /// RootWindowType 을 찾지 못할 경우 windows 배열에서 가장 큰 값의 safeAreaInsets를 반환합니다.
  private static func defaultSafeAreaInsets() -> UIEdgeInsets {
    return UIApplication.shared.currentWindows
      .map { $0.safeAreaInsets }
      .reduce(.zero) { result, insets in
        UIEdgeInsets(
          top: max(result.top, insets.top),
          left: max(result.left, insets.left),
          bottom: max(result.bottom, insets.bottom),
          right: max(result.right, insets.right)
        )
      }
  }
}

extension UIWindow {
  fileprivate func isRootWindow() -> Bool {
    return self is RootWindow
  }
}
