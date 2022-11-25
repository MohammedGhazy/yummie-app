//
//  UserModel.swift
//  Yummie
//
//  Created by Mohamed Ghazy on 23/11/2022.
//

import Foundation

struct User: Codable {
    let token: String?
    let customer: CustomerInfo?
    //let message: String?
}

// MARK: -CustomerInfo
struct CustomerInfo: Codable {
    let id: Int?
    let username: String?
    let firstName, lastName: String?
    let email: String?
    let active: Int?
    let phone: Int?
    let address: [Address]?

    enum CodingKeys: String, CodingKey {
        case id, username
        case firstName = "first_name"
        case lastName = "last_name"
        case email, active, phone, address
    }
}

struct Address: Codable {
    var id:Int?
    var address:String?
    var address2:String?
    var lat:Double?
    var lng:Double?
    var active: Int?
    var city:String?
    var government:String?
    var phone:String?
    var type:String?
    var street:String?
    var buildingNumber:Int?
    var floorNumber:Int?
    var details:String?
    
    
    
    init(id:Int?,
         address:String?,
         address2:String?,
         lat:Double?,
         lng:Double?,
         active:Int?,
         city:String?,
         government:String?,
         phone:String?,
         type:String?,
         street:String?,
         buildingNumber:Int?,
         floorNumber:Int?,
         details:String?) {
        
        self.id = id
        self.address = address
        self.address2 = address2
        self.lat = lat
        self.lng = lng
        self.active = active
        self.city = city
        self.government = government
        self.phone = phone
        self.type = type
        self.street = street
        self.buildingNumber = buildingNumber
        self.floorNumber = floorNumber
        self.details = details
    }
    
}
