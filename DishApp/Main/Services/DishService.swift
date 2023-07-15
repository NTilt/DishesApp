//
//  DishService.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import Foundation

protocol DishServiceProtocol {
    
    func fetchCategories(_ completion: @escaping (Dishes) -> ())
    
}

struct DishServiceImpl: DishServiceProtocol {
    
    func fetchCategories(_ completion: @escaping (Dishes) -> ()) {
        
        guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else { return }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            guard let dishes = try? JSONDecoder().decode(Dishes.self, from: data) else  { return }
            DispatchQueue.main.async {
                completion(dishes)
            }
        }
        .resume()
    }
}
