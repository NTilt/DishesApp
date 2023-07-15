//
//  CustomNavigationView.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI

struct CustomNavigationStack<Content: View>: View {
    
    var path: Binding<NavigationPath>
    let content: Content
    
    init(path: Binding<NavigationPath>, @ViewBuilder content: () -> Content) {
        self.path = path
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: path) {
            CustomNavBarContainerView {
                content
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

