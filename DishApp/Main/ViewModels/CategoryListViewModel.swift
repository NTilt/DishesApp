//
//  CategoryListViewModel.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import Foundation

class CategoryListViewModel: ObservableObject {
    
    @Published var categories = [DishCategory]()
    
    private let categoryService: CategoryServiceProtocol
    
    init( categoryService: CategoryServiceProtocol = CategoryServiceImpl()) {
        self.categoryService = categoryService
        categoryService.fetchCategories { categories in
            self.categories = categories.сategories
        }
    }
    
}
