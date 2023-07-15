//
//  MainView.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var mainCoordinator: MainCoordinator
    @StateObject private var categoryViewModel = CategoryListViewModel()
    
    var body: some View {
        CustomNavigationStack(path: $mainCoordinator.path) {
            mainCoordinator.build(viewModel: categoryViewModel)
                .navigationDestination(for: CategoryFlowCoordinator.self) { coordinator in
                    coordinator.build(dishFlow: mainCoordinator.dishFlow)
                }
        }
    }
}
