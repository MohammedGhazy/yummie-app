//
//  ApiResponse.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 09/11/2022.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
