//
//  CategoryListViewController + UICollectionView.swift
//  InterviewTask
//
//  Created by Kishore B on 9/6/24.
//

import UIKit

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension CategoryListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCell.categoryCollectioViewCell, for: indexPath) as? CategoryCollectioViewCell else {
            return UICollectionViewCell()
        }
        cell.configureImage(with: categories[indexPath.item].categoryImage)
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // MARK: - Scroll View Delegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updateVisibleIndex(scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        updateVisibleIndex(scrollView)
    }
    
    // MARK: - Helper Methods
    private func updateVisibleIndex(_ scrollView: UIScrollView) {
        let visibleIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = visibleIndex
        selectedIndex = visibleIndex
        categoriesTableView.reloadData()
    }
}
