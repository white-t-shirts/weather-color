//
//  HomeViewSection.swift
//  AppFeature_Home_Impl
//
//  Created by 김동환 on 10/2/25.
//

import Shared_ReactiveX

struct HomeViewSection: Equatable {
  enum Identity: Hashable {
    case title
  }

  var identity: Identity
  var items: [Item]
}

extension HomeViewSection: SectionModelType {
  enum Item: Hashable {
    case title(text: String)
  }

  init(original: HomeViewSection, items: [Item]) {
    self = original
    self.items = items
  }
}
