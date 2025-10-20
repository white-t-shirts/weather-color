//
//  HomeViewController.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 9/18/25.
//

import Shared_ReactiveX

import AppCore_UI

import AppContext_TabBar

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

  private let dependency: Dependency
  private let payload: Payload
  var disposeBag: DisposeBag = DisposeBag()
  private lazy var dataSource = self.createDataSource()


  // MARK: UI

  private lazy var collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout().then {
      $0.scrollDirection = .vertical
    }
  ).then {
    $0.register(Reusable.titleCell)
    $0.delegate = self
    $0.showsVerticalScrollIndicator = false
  }


  // MARK: Initialize

  init(dependency: Dependency, payload: Payload) {
    defer { self.reactor = payload.reactor }
    self.dependency = dependency
    self.payload = payload
    super.init(nibName: nil, bundle: nil)
    self.view.addSubview(self.collectionView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func createDataSource() -> RxCollectionViewSectionedReloadDataSource<HomeViewSection> {
    return .init(configureCell: { [weak self] _, collectionView, indexPath, sectionItem in
      switch sectionItem {
      case let .title(text):
        let cell = collectionView.dequeue(Reusable.titleCell, for: indexPath)
        self?.dependency.titleCellConfigurator.configure(cell, payload: .init(title: text))
        return cell
      }
    })
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

    reactor.state.map { $0.homeViewSection }
      .distinctUntilChanged()
      .bind(to: self.collectionView.rx.items(dataSource: self.dataSource))
      .disposed(by: self.disposeBag)
  }
}


// MARK: CollectionView Delegate

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let sectionItem = self.dataSource[indexPath]
    switch sectionItem {
    case .title:
      return HomeViewControllerMainTitleCell.size(width: collectionView.frame.width)
    }
  }
}
