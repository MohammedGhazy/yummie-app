//
//  UserModel.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 23/11/2022.
//

import Foundation

struct User: Codable {
    let token: String?
    let customer: Customer?
}

// MARK: - Customer
struct Customer: Codable {
    let id: Int
    let username: String
    let firstName, lastName: String?
    let email: String
    let active: Int
    let phone: String
    let address: [String]

    enum CodingKeys: String, CodingKey {
        case id, username
        case firstName = "first_name"
        case lastName = "last_name"
        case email, active, phone, address
    }
}
