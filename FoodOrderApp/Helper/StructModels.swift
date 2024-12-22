//
//  Variables.swift
//  FoodOrderApp
//
//  Created by ferid on 07.12.24.
//

import Foundation

struct User:Codable {
    var fullname: String
    var email: String
    var phoneNumber: String
    var password: String
}

struct Category:Codable {
    var categoryName: String
    var categoryImage: String
    var foods: [Food]
}
struct Food:Codable,Hashable {
    var foodName: String
    var foodImage: String
    var foodIngredients: [String]
    var foodPrice: String
}

