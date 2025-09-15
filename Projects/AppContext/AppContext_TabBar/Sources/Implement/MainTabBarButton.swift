//
//  MainTabBarButton.swift
//  AppContext_TabBar
//
//  Created by 김동환 on 9/13/25.
//

import RxSwift
import RxCocoa
import FlexLayout
import Then
import Pure

import UIKit

import AppContext_TabBar

final class MainTabBarButton: UIButton, ConfiguratorModule {

  // MARK: Constant

  static let height: CGFloat = 30

  // MARK: Module

  struct Dependency {
  }

  struct Payload: Equatable {
    let buttonType: MainTabBarType
    let tapObserver: AnyObserver<MainTabBarType>

    static func == (lhs: Self, rhs: Self) -> Bool {
      return lhs.buttonType == rhs.buttonType
    }
  }


  // MARK: Properties

  override var isSelected: Bool {
    didSet {
      guard oldValue != self.isSelected else { return }

      let tabImage = self.isSelected
        ? self.payload?.buttonType.selectedImage
        : self.payload?.buttonType.deselectedImage
      self.tabImageView.image = tabImage
    }
  }

  private var dependency: Dependency?
  private var payload: Payload?
  private var disposeBag = DisposeBag()


  // MARK: UI

  private let tabImageView = UIImageView().then {
    $0.clipsToBounds = true
    $0.contentMode = .scaleAspectFill
  }
  private let tabTitleLabel = UILabel()


  // MARK: Configure

  func configure(dependency: Dependency, payload: Payload) {
    guard self.payload != payload else { return }
    self.disposeBag = DisposeBag()
    self.dependency = dependency
    self.payload = payload

    self.configureButton(payload: payload)
    self.bindTap(payload: payload)
  }

  private func configureButton(payload: Payload) {
    self.tabTitleLabel.text = payload.buttonType.title
  }


  // MARK: Initialize

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .red
    self.defineFlexContainer()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  // MARK: Bind

  private func bindTap(payload: Payload) {
    self.rx.tap
      .map { _ in payload.buttonType }
      .bind(to: payload.tapObserver)
      .disposed(by: self.disposeBag)
  }


  // MARK: Layout

  override func layoutSubviews() {
    super.layoutSubviews()
    self.flex.layout()
  }

  private func defineFlexContainer() {
    self.flex
      .justifyContent(.spaceBetween)
      .alignItems(.center)
      .define {
        $0.addItem(self.tabImageView).size(15)
        $0.addItem(self.tabTitleLabel)
      }
  }
}
