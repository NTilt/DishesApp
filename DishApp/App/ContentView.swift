//
//  ContentView.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var appFactory = AppFactory()
    
    var body: some View {
        TabView {
            MainView(mainCoordinator: appFactory.mainCoordinator)
                .tabItem {
                    Label("Главная", image: Resource.TabBarItem.Main)
                }
                .tag(AppTab.main)
            
            SearchView()
                .tabItem { Label("Поиск", image: Resource.TabBarItem.Search) }
                .tag(AppTab.search)
            
            CartView(viewModel: appFactory.cartViewModel)
                .tabItem { Label("Корзина", image: Resource.TabBarItem.Cart) }
                .tag(AppTab.cart)
            
            AccountView()
                .tabItem { Label("Аккаунт", image: Resource.TabBarItem.Account) }
                .tag(AppTab.profile)
        }
    }
}

enum AppTab {
    case main
    case search
    case cart
    case profile
}
