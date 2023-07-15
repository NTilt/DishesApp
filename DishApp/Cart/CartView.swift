//
//  CartView.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        CustomNavBarContainerView {
            VStack {
                ScrollView {
                    ForEach(viewModel.dishes, id: \.self) { dish in
                        CartRow(dish: dish.dish, count: dish.count, events: viewModel.events)
                    }
                }
                if viewModel.dishes.count != 0 {
                    Button {
                        
                    } label: {
                        ZStack {
                            Color.blue
                            Text("Оплатить \(viewModel.finalPrice) ₽")
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 48)
                        .cornerRadius(20)
                        .padding([.leading, .trailing, .bottom])
                    }
                }
            }
        }
       
    }
}
