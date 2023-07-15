//
//  MainCoordinator.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import Foundation
import SwiftUI
import Combine

final class MainCoordinator: ObservableObject {
    
    @Published var path: NavigationPath
    private var cancellables = Set<AnyCancellable>()
    let dishFlow: PassthroughSubject<Dish?, Never>
    
    init(path: NavigationPath, dishFlow: PassthroughSubject<Dish?, Never>) {
        self.path = path
        self.dishFlow = dishFlow
    }
    
    private func push<T: Hashable>(_ coordinator: T) {
        path.append(coordinator)
    }
    
    @ViewBuilder
    func build(viewModel: CategoryListViewModel) -> some View {
        categoryListView(viewModel: viewModel)
    }
    
    private func categoryListView(viewModel: CategoryListViewModel) -> some View {
        let categoryListView = CategoryListView(viewModel: viewModel)
        bind(view: categoryListView)
        return categoryListView
    }
    
    private func bind(view: CategoryListView) {
        view.didClickCategory
            .receive(on: DispatchQueue.main)
            .sink { [weak self] category in
                self?.categoryFlow(category)
            }
            .store(in: &cancellables)
    }
    
    private func categoryFlow(_ category: DishCategory) {
        let categoryFlowCoordinator = CategoryFlowCoordinator(category: category)
        self.push(categoryFlowCoordinator)
    }
    
}
