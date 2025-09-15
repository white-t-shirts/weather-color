//
//  MainTabBarType.swift
//  AppContext_TabBar
//
//  Created by 김동환 on 9/13/25.
//

import UIKit

public enum MainTabBarType: CaseIterable {
  case home
  case setting

  public var title: String {
    switch self {
    case .home: return "Home"
    case .setting: return "Setting"
    }
  }

  public var deselectedImage: UIImage? {
    switch self {
    case .home: return UIImage(named: "cloud.sun")
    case .setting: return UIImage(named: "list.bullet")
    }
  }

  public var selectedImage: UIImage? {
    switch self {
    case .home: return UIImage(systemName: "cloud.sun")
    case .setting: return UIImage(systemName: "list.bullet")
    }
  }
}
