//
//  UIScreen+Sugar.swift
//  Shared_Foundation
//
//  Created by 김동환 on 9/13/25.
//

import UIKit

extension UIScreen {
  public static var width: CGFloat {
    return UIScreen.main.bounds.size.width
  }

  public static var height: CGFloat {
    return UIScreen.main.bounds.size.height
  }
}
