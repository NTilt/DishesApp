//
//  CategoryFlowCoordinator.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import Foundation
import SwiftUI
import Combine

final class CategoryFlowCoordinator: ObservableObject, Hashable {
    
    private var id: UUID = UUID()
    @Published var category: DishCategory
    
    init(category: DishCategory) {
        self.category = category
    }
    
    @ViewBuilder
    func build(dishFlow: PassthroughSubject<Dish?, Never>) -> some View {
        categoryDishesView(dishFlow: dishFlow)
    }
    
    private func categoryDishesView(dishFlow: PassthroughSubject<Dish?, Never>) -> some View {
        let viewModel = CategoryDishesViewModel(category: category, dishesFlow: dishFlow)
        let view = CategoryDishesView(viewModel: viewModel)
        return view
    }
    
    static func == (lhs: CategoryFlowCoordinator, rhs: CategoryFlowCoordinator) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
    }
    
}
