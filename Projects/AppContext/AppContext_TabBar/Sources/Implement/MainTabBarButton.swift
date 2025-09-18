//
//  MainTabBarButton.swift
//  AppContext_TabBar
//
//  Created by 김동환 on 9/13/25.
//

import Shared_ReactiveX
import Shared_Foundation

import AppCore_UI

import AppContext_TabBar

final class MainTabBarButton: UIButton, ConfiguratorModule {

  // MARK: Constant

  static let height: CGFloat = 52


  // MARK: Module

  struct Dependency {
  }

  struct Payload {
    let tapObserver: AnyObserver<MainTabBarType>
  }


  // MARK: Properties

  let tabBarType: MainTabBarType

  override var isSelected: Bool {
    didSet {
      let tabImage = self.isSelected
        ? self.tabBarType.selectedImage
        : self.tabBarType.deselectedImage
      self.tabImageView.image = tabImage

      let imageTintColor = self.isSelected
        ? self.tabBarType.selectedImageTintColor
        : self.tabBarType.deselectedImageTintColor
      self.tabImageView.tintColor = imageTintColor

      let font = self.isSelected
        ? self.tabBarType.selectedFont
        : self.tabBarType.deselectedFont
      self.tabTitleLabel.font = font
    }
  }

  private var dependency: Dependency?
  private var payload: Payload?
  private var disposeBag = DisposeBag()


  // MARK: UI

  private let tabImageView = UIImageView().then {
    $0.clipsToBounds = true
    $0.contentMode = .scaleAspectFit
  }
  private let tabTitleLabel = UILabel().then {
    $0.adjustsFontSizeToFitWidth = true
    $0.textColor = .secondaryLabel
  }


  // MARK: Configure

  func configure(dependency: Dependency, payload: Payload) {
    self.disposeBag = DisposeBag()
    self.dependency = dependency
    self.payload = payload

    self.bindTap(payload: payload)
  }


  // MARK: Initialize

  public init (tabBarButtonType: MainTabBarType) {
    self.tabBarType = tabBarButtonType
    self.tabTitleLabel.text = tabBarButtonType.title
    super.init(frame: .zero)
    self.defineFlexContainer()
  }

  @available(*, unavailable)
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  // MARK: Bind

  private func bindTap(payload: Payload) {
    self.rx.tap
      .do(onNext: { _ in
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
      })
      .map { [weak self] _ in self?.tabBarType ?? .home }
      .bind(to: payload.tapObserver)
      .disposed(by: self.disposeBag)
  }


  // MARK: Layout

  private func defineFlexContainer() {
    self.flex
      .alignItems(.center)
      .paddingTop(5)
      .define {
        $0.addItem(self.tabImageView).size(32)
        $0.addItem().height(3)
        $0.addItem(self.tabTitleLabel)
      }
  }
}
