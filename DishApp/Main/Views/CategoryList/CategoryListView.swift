//
//  CategoryListView.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI
import Combine

struct CategoryListView: View {
    
    @ObservedObject var viewModel: CategoryListViewModel
    let didClickCategory = PassthroughSubject<DishCategory, Never>()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.categories) { category in
                CardCategory(category: category)
                    .onTapGesture {
                        didClickCategory.send(category)
                    }
            }
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(viewModel: CategoryListViewModel())
    }
}
