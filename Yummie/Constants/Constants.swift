//
//  Constants.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 06/11/2022.
//

import Foundation

class Constants {
    static let onboardingReuseIdentifier = "onboardingID"
    static let categoryReuseIdentifier   = "categoryID"
    static let popularReuseIdentifier    = "popularID"
    static let specialReuseIdentifier    = "specialID"
    static let allDishesReuseIdentefier  = "AllDishesID"
    static let HomeStoryboardID        = "HomeNC"
    
    static var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    var user: User? { get
        {
        guard let user = UserDefaults.standard.data(forKey: "userModel") else { return nil }
        let decoder = JSONDecoder()
        let data    = try? decoder.decode(User.self , from: user)
        return data
    }}
    
}

