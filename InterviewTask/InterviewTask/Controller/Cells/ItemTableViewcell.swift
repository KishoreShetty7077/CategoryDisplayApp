//
//  ItemTableViewcell.swift
//  Task
//
//  Created by Kishore B on 3/9/24.
//

import UIKit

// MARK: - ItemTableViewcell
class ItemTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    // MARK: - Configuration
    func configureData(with data: CategoryItemDetailsModel) {
        self.itemImageView.image = UIImage(named: data.imageName) ?? UIImage()
        self.itemLabel.text = data.itemName
    }

}
