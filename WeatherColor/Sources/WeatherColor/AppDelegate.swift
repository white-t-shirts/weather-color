//
//  AppDelegate.swift
//  WeatherColor
//
//  Created by 김동환 on 8/16/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    let root = ViewController()
    let nav = UINavigationController(rootViewController: root)
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = nav
    self.window?.makeKeyAndVisible()

    return true
  }
}
