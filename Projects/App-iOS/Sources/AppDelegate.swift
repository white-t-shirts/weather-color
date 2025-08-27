//
//  AppDelegate.swift
//  WeatherColor
//
//  Created by 김동환 on 8/16/25.
//

import UIKit

import App

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    AppStarter.start(in: window)
    window.makeKeyAndVisible()
    return true
  }
}
