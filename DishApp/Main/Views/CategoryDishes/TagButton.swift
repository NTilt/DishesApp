//
//  TagButton.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI

struct TagButton: View {
    
    var tagName: String
    var completion: (String) -> Void
    
    var body: some View {
        Button {
            completion(tagName)
        } label: {
            Text(tagName)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.white)
                .frame(width: 94, height: 35)
                .background(.blue)
                .mask(RoundedRectangle(cornerRadius: 15))
        }

    }
}
