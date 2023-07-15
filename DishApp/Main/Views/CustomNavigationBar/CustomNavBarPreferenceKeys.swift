//
//  CustomNavBarPreferenceKeys.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI

struct CustomNavBarTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}

struct CustomNavBarLocationHiddenPreferenceKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}

struct CustomNavBarBackgroundColorPreferenceKey: PreferenceKey {
    
    static var defaultValue: Color = Color.white
    
    static func reduce(value: inout Color, nextValue: () -> Color) {
        value = nextValue()
    }
}

extension View {
    
    func customBackgroundColor(_ color: Color) -> some View {
        preference(key: CustomNavBarBackgroundColorPreferenceKey.self, value: color)
    }
    
    func customNavigationTitle(_ title: String) -> some View {
        preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    
    func customNavigationLocationHidden(_ isHidden: Bool) -> some View {
        preference(key: CustomNavBarLocationHiddenPreferenceKey.self, value: isHidden)
    }
    
}
