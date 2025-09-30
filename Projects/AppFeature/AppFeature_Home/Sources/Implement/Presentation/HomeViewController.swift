//
//  HomeViewController.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/18/25.
//

import Shared_ReactiveX

import AppCore_UI

import AppFeature_Home

final class HomeViewController: UIViewController, @preconcurrency View, @preconcurrency FactoryModule, HomeViewControllerType {

  // MARK: Module

  struct Dependency {
  }

  struct Payload {
    let reactor: HomeViewReactor
  }


  // MARK: Properties

  private let dependnecty: Dependency
  private let payload: Payload
  var disposeBag: DisposeBag = DisposeBag()


  // MARK: Initialize

  init(dependency: Dependency, payload: Payload) {
    defer { self.reactor = payload.reactor }
    self.dependnecty = dependency
    self.payload = payload
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  // MARK: View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }


  // MARK: Bind

  func bind(reactor: HomeViewReactor) {
    reactor.action.onNext(.fetchWeather)
  }
}
