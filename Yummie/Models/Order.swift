//
//  Order.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 07/11/2022.
//

import Foundation

struct Order: Decodable {
    var id: String?
    var name: String?
    var dish:Dish?
}
