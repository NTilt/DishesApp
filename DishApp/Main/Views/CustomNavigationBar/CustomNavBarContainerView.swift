//
//  CustomNavBarContainerView.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var title: String = ""
    @State private var locationIsHidden: Bool = false
    @State private var backgroundColor: Color = .white
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBarView(title: title, locationIsHidden: locationIsHidden, backgroundColor: backgroundColor)
            content
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarLocationHiddenPreferenceKey.self) { value in
            self.locationIsHidden = value
        }
        .onPreferenceChange(CustomNavBarBackgroundColorPreferenceKey.self) { color in
            withAnimation(.linear(duration: 0.3)) {
                self.backgroundColor = color
            }
        }
    }
}
