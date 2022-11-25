//
//  PopularDish.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 07/11/2022.
//

import Foundation
struct Dish: Decodable {
    
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
