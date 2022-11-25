//
//  AllDishes.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 07/11/2022.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
