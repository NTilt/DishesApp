//
//  AppFactory.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import Foundation
import SwiftUI
import Combine

final class AppFactory: ObservableObject {
    
    @Published var mainCoordinator: MainCoordinator
    @Published var cartViewModel: CartViewModel
    let dishFlow: PassthroughSubject<Dish?, Never>
    
    init() {
        self.dishFlow = PassthroughSubject<Dish?, Never>()
        self.mainCoordinator = MainCoordinator(path: NavigationPath(), dishFlow: self.dishFlow)
        self.cartViewModel = CartViewModel(dishFlow: self.dishFlow)
    }
    
}
