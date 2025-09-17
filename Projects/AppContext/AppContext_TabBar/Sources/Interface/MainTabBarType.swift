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

  public var selectedFont: UIFont {
    return UIFont.systemFont(ofSize: 9, weight: .bold)
  }

  public var deselectedFont: UIFont {
    return UIFont.systemFont(ofSize: 9, weight: .medium)
  }

  public var selectedImage: UIImage? {
    switch self {
    case .home: return UIImage(systemName: "cloud.sun.fill")
    case .setting: return UIImage(systemName: "list.dash.header.rectangle")
    }
  }

  public var deselectedImage: UIImage? {
    switch self {
    case .home: return UIImage(systemName: "cloud.sun")
    case .setting: return UIImage(systemName: "list.dash.header.rectangle")
    }
  }

  public var selectedImageTintColor: UIColor {
    return .systemGray
  }

  public var deselectedImageTintColor: UIColor {
    return .systemGray3
  }
}
