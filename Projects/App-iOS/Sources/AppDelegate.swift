//
//  AppDelegate.swift
//  WeatherColor
//
//  Created by 김동환 on 8/16/25.
//

import UIKit

import Shared_Foundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  private lazy var dependency = CompositionRoot.resolve()
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    let window = RootWindow(frame: UIScreen.main.bounds)
    self.window = window
    
    self.dependency.appStarter.start(in: window)
    window.makeKeyAndVisible()
    return true
  }
}
