//
//  PopularCollectionViewCell.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 07/11/2022.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(popular: Dish) {
        dishNameLabel.text = popular.name
        dishImageView.kf.setImage(with: popular.image?.asURL)
        caloriesLabel.text    = "\(String(describing: popular.calories!)) calories" 
        descriptionLabel.text = popular.description
    }

}
