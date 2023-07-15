//
//  CategoryDishesView.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI
import Combine

struct CategoryDishesView: View {
    
    @ObservedObject var viewModel: CategoryDishesViewModel
    @State var currentDish: Dish?
    @State var currentTag = "Все меню"
    
    var body: some View {
        CustomNavBarContainerView {
            VStack(alignment: .leading) {
                if !viewModel.showDetail {
                    listOfTags
                }
                listOfDishes
            }
            .popUpView(show: viewModel.showDetail, content: {
                DishDetailView(dish: currentDish, events: viewModel.events)
                    .customBackgroundColor(Color.primary.opacity(0.45))
                    .toolbarBackground(Color.primary.opacity(0.45), for: .tabBar)
            })
            .customNavigationTitle(viewModel.category.name)
            .customNavigationLocationHidden(true)
            .toolbar(.hidden, for: .navigationBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
    
    @ViewBuilder
    var listOfTags: some View {
        let rows = [
            GridItem(.fixed(35))
        ]
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 8) {
                ForEach(viewModel.tags, id: \.self) { tag in
                    Button {
                        currentTag = tag
                        viewModel.events.send(.selectTag(tag))
                    } label: {
                        Text(tag)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(currentTag == tag ? .white : .black)
                            .frame(width: 94, height: 35)
                            .background(currentTag == tag ? .blue: .primary.opacity(0.05))
                            .mask(RoundedRectangle(cornerRadius: 15))
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
        .frame(maxHeight: 35)
        .padding(.bottom)
    }
    
    @ViewBuilder
    var listOfDishes: some View {
        
        let columns = [
            GridItem(.adaptive(minimum: 109), spacing: 8, alignment: .top),
            GridItem(.adaptive(minimum: 109), spacing: 8, alignment: .top),
            GridItem(.adaptive(minimum: 109), spacing: 8, alignment: .top),
        ]
        
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 13) {
                ForEach(viewModel.dishes) { dish in
                    CardDish(imageURL: dish.imageUrl, name: dish.name)
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.3)) {
                                currentDish = dish
                                viewModel.showDishDetail()
                            }
                        }
//                        .background {
//                            Color.red
//                        }
                }
            }
            .padding()
        }
    }
}

struct Stac_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDishesView(viewModel: CategoryDishesViewModel(category: DishCategory(id: 1, name: "asd", imageURL: ""), dishesFlow: PassthroughSubject<Dish?, Never>()), currentDish: nil)
    }
}
