//
//  AppStarter.swift
//  WeatherColor
//
//  Created by 김동환 on 8/16/25.
//

import UIKit

public enum AppStarter {
  public static func start(in window: UIWindow) {
    let root = UINavigationController(rootViewController: ViewController())
    window.rootViewController = root
  }
}
