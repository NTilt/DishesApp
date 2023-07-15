//
//  CartRow.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI
import Combine

struct CartRow: View {
    var dish: Dish
    var count: Int
    let events: PassthroughSubject<CartEvent, Never>
    
    var body: some View {
        HStack {
            dishDetail
            Spacer()
            customStepper
                .frame(width: 100, height: 32)
                .padding(.trailing)
        }
    }
    
    var customStepper: some View {
        HStack {
            Button {
                events.send(.decrementDish(dish))
            } label: {
                Image(Resource.Icon.minus)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(.black)
                    
            }
            .frame(width: 24, height: 24)
            .padding([.top, .leading, .bottom], 5)
            Text("\(count)")
                .font(.system(size: 14, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Button {
                events.send(.incrementDish(dish))
            } label: {
                Image(Resource.Icon.plus)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(.black)
                    
            }
            .frame(width: 24, height: 24)
            .padding([.top, .trailing, .bottom], 5)

        }
        .background(Color.gray.opacity(0.15))
        .cornerRadius(10)
    }
    
    var dishDetail: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: dish.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 62, maxHeight: 62)
            .padding(8)
            .background(Color.primary.opacity(0.05))
            .mask(RoundedRectangle(cornerRadius: 20))
            VStack(alignment: .leading) {
                Text(dish.name)
                    .font(.system(size: 14, weight: .regular))
                    .multilineTextAlignment(.leading)
                HStack {
                    Text("\(dish.price) ₽")
                    Text("· \(dish.weight)г")
                        .foregroundColor(.gray)
                }
                .font(.system(size: 14, weight: .regular))
                
            }
            .frame(width: 115)

        }
        .frame(idealHeight: 82)
        .padding([.leading, .trailing])
    }
}
