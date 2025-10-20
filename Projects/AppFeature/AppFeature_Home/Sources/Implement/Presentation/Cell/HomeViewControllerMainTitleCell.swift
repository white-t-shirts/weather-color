//
//  HomeViewControllerMainTitleCell.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 10/2/25.
//

import AppCore_UI

final class HomeViewControllerMainTitleCell: UICollectionViewCell, ConfiguratorModule {

  // MARK: Module

  struct Dependency {
  }

  struct Payload: Equatable {
    let title: String
  }


  // MARK: Properties

  var dependency: Dependency?
  var payload: Payload?
  
  // MARK: UI

  private let titleLabel = UILabel().then {
    $0.textColor = .label
    $0.textAlignment = .natural
  }


  // MARK: Configure

  func configure(dependency: Dependency, payload: Payload) {
    guard self.payload != payload else { return }
    self.dependency = dependency
    self.payload = payload

    self.titleLabel.text = payload.title
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.contentView.addSubview(self.titleLabel)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  // MARK: Layout

  override func layoutSubviews() {
    super.layoutSubviews()
    self.titleLabel.pin.all()
  }

  static func size(width: CGFloat) -> CGSize {
    return .init(width: width, height: 40)
  }
}
