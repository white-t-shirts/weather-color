//
//  MainTabBarController.swift
//  WeatherColor
//
//  Created by 김동환 on 8/16/25.
//

import Shared_Foundation
import Shared_ReactiveX

import AppCore_UI

import AppContext_TabBar

import AppFeature_Home
import AppFeature_Setting

final class MainTabBarController: UITabBarController, @preconcurrency FactoryModule, @preconcurrency View {

  // MARK: Module

  struct Dependency {
    let tabBarFactory: MainTabBarViewFactory
    let homeViewControllerFactory: HomeViewControllerFactoryType
    let settingViewControllerFactory: SettingViewControllerFactoryType
  }

  struct Payload {
    let reactor: MainTabBarControllerReactor
  }


  // MARK: Properties

  private let dependency: Dependency
  private let payload: Payload
  var disposeBag = DisposeBag()


  // MARK: UI

  private var tabBarView: MainTabBarViewType?
  private let selectedTabRelay = PublishRelay<MainTabBarType>()


  // MARK: View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
  }


  // MARK: Initialize

  init(dependency: Dependency, payload: Payload) {
    defer { self.reactor = payload.reactor }
    self.dependency = dependency
    self.payload = payload
    super.init(nibName: nil, bundle: nil)
    self.tabBar.isHidden = true
    self.setTabBarView(dependency: dependency)
    self.defineFlexContainer()
    self.setupViewControllers()
  }

  private func setTabBarView(dependency: Dependency) {
    self.tabBarView = dependency.tabBarFactory.create(payload: .init(
      selectedTabObserver: .init(eventHandler: { [weak self] tabSelectEvent in
        guard let selectedTab = tabSelectEvent.element else { return }
        self?.selectedTabRelay.accept(selectedTab)
      })
    )) as? MainTabBarViewType
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViewControllers() {
    let viewControllers = MainTabBarType.allCases.map { item -> UIViewController in
      switch item {
      case .home:
        guard let viewController = self.homeViewController() else { return UIViewController() }
        return UINavigationController(rootViewController: viewController)

      case .setting:
        guard let viewController = self.settingViewController() else { return UIViewController() }
        return UINavigationController(rootViewController: viewController)
      }
    }
    self.setViewControllers(viewControllers, animated: false)
  }


  // MARK: Bind

  func bind(reactor: MainTabBarControllerReactor) {
    self.selectedTabRelay
      .map(Reactor.Action.selectTab)
      .bind(to: reactor.action)
      .disposed(by: self.disposeBag)

    reactor.pulse(\.$selectedTabIndex)
      .asDriver(onErrorDriveWith: .empty())
      .drive(onNext: { [weak self] selectedIndex in
        self?.selectedIndex = selectedIndex
      })
      .disposed(by: self.disposeBag)
  }


  // MARK: Layout

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.layoutFlexContainer()
  }

  private func defineFlexContainer() {
    guard let tabBar = self.tabBarView else { return }

    self.view.addSubview(tabBar)
  }

  private func layoutFlexContainer() {
    guard let tabBar = self.tabBarView else { return }

    tabBar.pin.horizontally()
      .bottom()
      .height(tabBar.height)
  }


  // MARK: ViewControllers

  private func homeViewController() -> HomeViewControllerType? {
    let viewController = self.dependency.homeViewControllerFactory.create(payload: .init(
    )) as? HomeViewControllerType
    return viewController
  }

  private func settingViewController() -> SettingViewControllerType? {
    let viewController = self.dependency.settingViewControllerFactory.create(payload: .init(
    )) as? SettingViewControllerType
    return viewController
  }
}
