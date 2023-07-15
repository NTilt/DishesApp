//
//  CategoryDishesViewModel.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import Foundation
import Combine

enum Events {
    case closeDishDetail
    case selectTag(String)
    case addToCart(Dish?)
}

class CategoryDishesViewModel: ObservableObject {
    
    @Published var dishes = [Dish]()
    @Published var tags = [String]()
    @Published var category: DishCategory
    @Published var showDetail: Bool = false
    
    let events = PassthroughSubject<Events, Never>()
    let dishesFlow: PassthroughSubject<Dish?, Never>
    var allDishes = [Dish]()
    var cancellables = Set<AnyCancellable>()
    
    private let dishService: DishServiceProtocol
    
    init(category: DishCategory,
         dishesFlow: PassthroughSubject<Dish?, Never>,
         dishService: DishServiceProtocol = DishServiceImpl()) {
        self.category = category
        self.dishesFlow = dishesFlow
        self.dishService = dishService
        self.dishService.fetchCategories { dishes in
            self.allDishes = dishes.dishes
            self.dishes = dishes.dishes
            self.dishes.forEach { dish in
                self.tags.append(contentsOf: dish.tegs.filter({ newTeg in
                    !self.tags.contains(where: { teg in
                        teg == newTeg
                    })
                }))
            }
        }
        
        self.events
            .sink { [weak self] event in
                switch event {
                case .closeDishDetail:
                    self?.showDetail = false
                case .selectTag(let tag):
                    self?.dishesFromTag(from: tag)
                case .addToCart(let dish):
                    self?.dishesFlow.send(dish)
                }
            }
            .store(in: &cancellables)
    }
    
    func dishesFromTag(from tag: String) {
        self.dishes = allDishes.filter { dish in
            dish.tegs.contains { dishTag in
                dishTag == tag
            }
        }
    }
    
    func showDishDetail() {
        self.showDetail = true
    }
    
}
