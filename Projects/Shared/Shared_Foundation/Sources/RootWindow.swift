//
//  RootWindow.swift
//  Shared_Foundation
//
//  Created by 김동환 on 9/13/25.
//

import UIKit

public final class RootWindow: UIWindow {
  public override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  public override init(windowScene: UIWindowScene) {
    super.init(windowScene: windowScene)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
