//
//  UIApplication+Windows.swift
//  Shared_Foundation
//
//  Created by 김동환 on 9/13/25.
//

import UIKit

// iOS 16+ 환경에서는 UIWindowScene 활용 필요.
// UIApplication.shared.currentWindows 형태 혹은 UIApplication 인스턴스를 주입받아 사용할 것
public extension UIApplication {
  var currentWindows: [UIWindow] {
    // background 상태는 제외하고 foreground 상태의 Scene 에서만 Window 추출
    let visibleScenes = self.connectedScenes.filter {
      $0.activationState == .foregroundActive || $0.activationState == .foregroundInactive
    }
    
    return visibleScenes
      .compactMap { $0 as? UIWindowScene }
      .flatMap { $0.windows }
  }
}
