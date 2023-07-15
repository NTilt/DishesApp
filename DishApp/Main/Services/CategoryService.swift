//
//  CategoryService.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import Foundation

protocol CategoryServiceProtocol {
    
    func fetchCategories(_ completion: @escaping (Categories) -> ())
    
}

struct CategoryServiceImpl: CategoryServiceProtocol {
    
    func fetchCategories(_ completion: @escaping (Categories) -> ()) {
        
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else { return }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            guard let categories = try? JSONDecoder().decode(Categories.self, from: data) else  { return }
            DispatchQueue.main.async {
                completion(categories)
            }
        }
        .resume()
    }
}
