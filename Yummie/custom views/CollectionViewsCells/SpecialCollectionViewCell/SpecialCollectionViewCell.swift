//
//  SpecialCollectionViewCell.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 07/11/2022.
//

import UIKit

class SpecialCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var specialImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    
    
    func setup(special: Dish) {
        specialImageView.kf.setImage(with: special.image?.asURL)
        nameLabel.text        = special.name
        descriptionLabel.text = special.description
        calorieLabel.text     = "\(String(describing: special.calories!)) calories"
    }

}
