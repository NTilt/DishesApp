//
//  CardCategory.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI

struct CardCategory: View {
    
    let category: DishCategory
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.name)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.black)
                .frame(width: 191, height: 50, alignment: .leading)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .multilineTextAlignment(.leading)
        }
        .padding(20)
        .frame(width: 343, height: 148)
        .frame(maxWidth: .infinity)
        .background(
            AsyncImage(url: URL(string: category.imageURL), content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            }, placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            })
        )
        .mask(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
        )
        .padding([.trailing, .leading])
    }
}
