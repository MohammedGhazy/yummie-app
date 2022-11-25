//
//  DishCategory.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 06/11/2022.
//

import Foundation
import UIKit

struct DishCategory: Decodable {
    var id , name , image: String
    
    enum CodingKeys: String, CodingKey {
           case id
           case name = "title"
           case image
       }
}
