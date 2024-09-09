//
//  CategoryCollectioViewCell.swift
//  Task
//
//  Created by Kishore B on 3/9/24.
//


import UIKit

// MARK: - CategoryCollectioViewCell
class CategoryCollectioViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var categoryTypeImageView: UIImageView!
    
    // MARK: - Configuration
    func configureImage(with imageString: String) {
        self.categoryTypeImageView.image = UIImage(named: imageString) ?? UIImage()
    }
}
