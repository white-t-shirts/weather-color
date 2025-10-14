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
    let titleCellConfigurator: HomeViewControllerMainTitleCell.Configurator
  }

  struct Payload {
    let reactor: HomeViewReactor
  }

  @MainActor
  private enum Reusable {
    static let titleCell = ReusableCell<HomeViewControllerMainTitleCell>()
  }


  // MARK: Properties

  private let dependnecty: Dependency
  private let payload: Payload
  var disposeBag: DisposeBag = DisposeBag()


  // MARK: UI

  private let collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout().then {
      $0.scrollDirection = .vertical
    }
  ).then {
    $0.register(Reusable.titleCell)
    $0.showsVerticalScrollIndicator = false
  }


  // MARK: Initialize

  init(dependency: Dependency, payload: Payload) {
    defer { self.reactor = payload.reactor }
    self.dependnecty = dependency
    self.payload = payload
    super.init(nibName: nil, bundle: nil)
    self.view.addSubview(self.collectionView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func createDataSource() -> RxCollectionViewSectionedReloadDataSource<HomeViewSection> {
    return .init(
      configureCell: { [weak self] _, collectionView, indexPath, sectionItem in
        return UICollectionViewCell()
      }
    )
  }


  // MARK: View Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.collectionView.pin.all()
  }


  // MARK: Bind

  func bind(reactor: HomeViewReactor) {
    reactor.action.onNext(.fetchWeather(cityName: "seoul"))
  }
}
