//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 06/11/2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(category: DishCategory) {
        categoryImageView.kf.setImage(with: category.image.asURL)
        categoryTitleLabel.text = category.name
    }
}
