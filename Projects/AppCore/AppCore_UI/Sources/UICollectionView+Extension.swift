//
//  UICollectionView+Extension.swift
//  AppCore_UI
//
//  Created by 김동환 on 10/20/25.
//

extension UICollectionView {
  public func emptyCell(for indexPath: IndexPath) -> UICollectionViewCell {
    let identifier = "weatherColor.UICollectionView.emptyCell"
    self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    cell.isHidden = true
    return cell
  }

  public func emptyView(for indexPath: IndexPath, kind: String) -> UICollectionReusableView {
    let identifier = "weatherColor.UICollectionView.emptyView"
    self.register(UICollectionReusableView.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
    let view = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath)
    view.isHidden = true
    return view
  }
}
