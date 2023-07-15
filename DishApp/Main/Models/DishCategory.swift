//
//  DishCategory.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import Foundation

struct DishCategory: Codable, Identifiable {
    let id: Int
    let name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
    }
}

struct Categories: Codable {
    let сategories: [DishCategory]
}
