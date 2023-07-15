//
//  CartViewModel.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import Foundation
import Combine


enum CartEvent {
    case incrementDish(Dish)
    case decrementDish(Dish)
}

struct CartDish: Identifiable, Hashable {
    
    let id: UUID
    let dish: Dish
    var count: Int
    
    mutating func increment() {
        self.count += 1
    }
    
    mutating func decrement() {
        self.count -= 1
    }
    
    init(dish: Dish) {
        self.id = UUID()
        self.dish = dish
        self.count = 1
    }
}

final class CartViewModel: ObservableObject {
    
    @Published var dishes = [CartDish]()
    @Published var finalPrice = 0
    
    let events = PassthroughSubject<CartEvent, Never>()
    let dishFlow: PassthroughSubject<Dish?, Never>
    var cancellables = Set<AnyCancellable>()
    
    
    init(dishFlow: PassthroughSubject<Dish?, Never>) {
        self.dishFlow = dishFlow
        
        dishFlow.sink { dish in
            if let newDish = dish {
                if self.dishes.contains(where: { cartDish in
                    cartDish.dish == newDish
                }) {
                    self.incrementDishCount(dish: newDish)
                }
                else {
                    self.dishes.append(CartDish(dish: newDish))
                    self.finalPrice += newDish.price
                }
                
            }
        }
        .store(in: &cancellables)
        
        events
            .sink { [weak self] event in
                switch event {
                case .incrementDish(let dish):
                    self?.incrementDishCount(dish: dish)
                case .decrementDish(let dish):
                    self?.decrementDishCount(dish: dish)
                }
            }
            .store(in: &cancellables)
    }
    
    private func incrementDishCount(dish: Dish) {
        if let index = index(of: dish) {
            dishes[index].increment()
            self.finalPrice += dish.price
        }
    }
    
    private func decrementDishCount(dish: Dish) {
        if let index = index(of: dish) {
            dishes[index].decrement()
            self.finalPrice -= dish.price
            if dishes[index].count == 0 {
                dishes.removeAll { cartDish in
                    cartDish.dish == dish
                }
            }
        }
    }
    
    private func index(of dish: Dish) -> Int? {
        for index in 0..<dishes.count {
            if dishes[index].dish == dish {
                return index
            }
        }
        return nil
    }
    
}
