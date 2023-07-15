//
//  Dish.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import Foundation

struct Dish: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let imageUrl: String
    let tegs: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, price, weight, description, tegs
        case imageUrl = "image_url"
    }
}


struct Dishes: Codable {
    let dishes: [Dish]
}
