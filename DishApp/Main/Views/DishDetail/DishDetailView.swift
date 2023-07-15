//
//  DishDetailView.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI
import Combine

struct DishDetailView: View {
    
    var dish: Dish?
    var events: PassthroughSubject<Events, Never>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: dish?.imageUrl ?? ""), content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }, placeholder: {
                ProgressView()
                    .frame(maxHeight: .infinity)
            })
            .frame(maxWidth: .infinity)
            .frame(minHeight: 232)
            .background(Color.primary.opacity(0.05))
            .cornerRadius(20)
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        buttons
                    }
                    .padding()
                    Spacer()
                }
            }
            Text(dish?.name ?? "")
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .medium))
            HStack {
                Text("\(dish?.price ?? 100) ₽")
                    .foregroundColor(.black)
                Text("· \(dish?.weight ?? 500)г")
                    .foregroundColor(.gray)
            }
            .font(.system(size: 14, weight: .regular))
            Text(dish?.description ?? "")
                .foregroundColor(.gray)
                .font(.system(size: 14, weight: .regular))
                .padding(.bottom)
            Button {
                events.send(.addToCart(dish))
                events.send(.closeDishDetail)
            } label: {
                ZStack {
                    Color.blue
                    Text("Добавить в корзину")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 48)
                .cornerRadius(20)
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .padding()
    }
    
    var buttons: some View {
        HStack {
            favoritesButton
                .frame(width: 40, height: 40)
                .background(Color.white)
                .cornerRadius(15)
            backButton
                .frame(width: 40, height: 40)
                .background(Color.white)
                .cornerRadius(15)
        }
        
    }
    
    var favoritesButton: some View {
        Button {
            print("fav")
        } label: {
            Image(Resource.Icon.heart)
                .resizable()
                .frame(width: 24, height: 24)
        }

    }
    
    var backButton: some View {
        Button {
            withAnimation(.linear(duration: 0.3)) {
                events.send(.closeDishDetail)
            }
        } label: {
            Image(Resource.Icon.xmark)
                .resizable()
                .frame(width: 24, height: 24)
                .background(Color.white)
                .cornerRadius(10)
        }
    }
}
