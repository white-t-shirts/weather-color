//
//  MainTabBar.swift
//  AppContext_TabBar
//
//  Created by 김동환 on 9/13/25.
//

import Shared_ReactiveX
import Shared_Foundation

import AppCore_UI

import AppContext_TabBar

final class MainTabBar: UIView, MainTabBarViewType, View, FactoryModule {

  // MARK: Module

  public struct Dependency {
    let buttonConfigurator: MainTabBarButton.Configurator
  }

  public struct Payload {
    let reactor: MainTabBarReactor
  }


  // MARK: Properties

  var height: CGFloat = UIScreen.safeAreaInsets.bottom + MainTabBarButton.height
  var disposeBag = DisposeBag()

  private let selectedButtonRelay: BehaviorRelay<MainTabBarType> = BehaviorRelay(value: .home)
  private let dependency: Dependency
  private let payload: Payload


  // MARK: UI

  private var tabBarButtons: [MainTabBarButton] = []


  // MARK: Configure


  func bind(reactor: MainTabBarReactor) {
    reactor.pulse(\.$selectedTab)
      .asDriver(onErrorDriveWith: .empty())
      .drive(onNext: { [weak self] selectedTab in
        self?.tabBarButtons.forEach { button in
          button.isSelected = (button.tabBarType == selectedTab)
        }
      })
      .disposed(by: self.disposeBag)

    self.selectedButtonRelay
      .map(MainTabBarReactor.Action.selectTab)
      .bind(to: reactor.action)
      .disposed(by: self.disposeBag)
  }


  // MARK: Initialize

  public init(dependency: Dependency, payload: Payload) {
    defer { self.reactor = payload.reactor }
    self.dependency = dependency
    self.payload = payload
    super.init(frame: .zero)
    self.setButtons(dependency: dependency)
    self.defineFlexContainer()
    self.configureLayerRadius()
    self.configureBorder()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setButtons(dependency: Dependency) {
    let buttons = MainTabBarType.allCases.map { [weak self] buttonType in
      let button = MainTabBarButton(tabBarButtonType: buttonType)
      dependency.buttonConfigurator.configure(button, payload: .init(
        tapObserver: .init(eventHandler: { [weak self] _ in
          self?.selectedButtonRelay.accept(buttonType)
        })
      ))
      return button
    }
    self.tabBarButtons = buttons
  }


  // MARK: Layout

  override func layoutSubviews() {
    super.layoutSubviews()
    self.flex.layout()
  }

  private func configureLayerRadius() {
    self.layer.cornerRadius = 30
    self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    self.layer.masksToBounds = true
  }

  private func configureBorder() {
    self.layer.borderWidth = 0.3
    self.layer.borderColor = UIColor.lightGray.cgColor
  }

  private func defineFlexContainer() {
    self.flex
      .direction(.row)
      .justifyContent(.center)
      .paddingBottom(UIScreen.safeAreaInsets.bottom)
      .define { flex in
        self.layoutButtons(flex)
      }
  }

  @discardableResult
  private func layoutButtons(_ flex: Flex) -> Flex {
    flex.define { flex in
      for (index, button) in self.tabBarButtons.enumerated() {
        flex.addItem(button)
          .height(MainTabBarButton.height)
          .width(50)
        if index < self.tabBarButtons.count - 1 {
          flex.addItem().width(100)
        } // 마지막 버튼의 경우 공백을 넣지 않음
      }
    }
  }
}
