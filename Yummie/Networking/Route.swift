//
//  Route.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 09/11/2022.
//

import Foundation

enum Route {
    
    static let baseUrl = "https://yummie.glitch.me"
    //static let authUrl = "https://ci.crazyideaco.com/wolf/public/api/customer"
    case fetchAllCategories
    case placeOrder(String)
    case fetchCategoryDishes(String)
    case fetchOrders
    //case register
    
    var description: String {
        switch self {
        case .fetchAllCategories:
            return "/dish-categories"
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        case .fetchCategoryDishes(let categoryId):
            return "/dishes/\(categoryId)"
        case .fetchOrders:
            return "/orders"
//        case .register:
//            return "/sign-up"
        }
    }
}
