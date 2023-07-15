//
//  View.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import Foundation
import SwiftUI

extension View {
    
    func popUpView<Content: View>(show: Bool, @ViewBuilder content: @escaping () -> Content) -> some View {
        
        return self
            .overlay {
                if show {
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        Color.primary
                            .opacity(0.45)
                            .ignoresSafeArea()
                        
                        content()
                            .frame(height: size.height / 1.2, alignment: .center)
                            .cornerRadius(15)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                }
            }
    }
    
}
