//
//  DishListCell.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 07/11/2022.
//

import UIKit

class DishListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var decriptionLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    func setup(dish: Dish) {
        nameLabel.text = dish.name
        decriptionLabel.text = dish.description
        dishImageView.kf.setImage(with: dish.image?.asURL)
    }
    
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asURL)
        nameLabel.text = order.dish?.name
        decriptionLabel.text = order.dish?.description
    }
}
