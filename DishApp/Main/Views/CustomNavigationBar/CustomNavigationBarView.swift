//
//  CustomNavigationBarView.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI

struct CustomNavigationBarView: View {
    
    @Environment(\.dismiss) var dismiss
    let title: String
    let locationIsHidden: Bool
    let backgroundColor: Color
    
    var body: some View {
        HStack {
            if !locationIsHidden {
                locationSection
                Spacer()
                profileSection
            }
            else {
                backButton
                Spacer()
                titleSection
                Spacer()
                profileSection
            }

        }
        .padding([.top, .bottom])
        .background(backgroundColor)
    }
}

extension CustomNavigationBarView {
    
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image(Resource.Icon.arrowBack)
                .foregroundColor(.black)
        }
        
    }
    
    private var titleSection: some View {
        Text(title)
            .font(.system(size: 18, weight: .medium))
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private var profileSection: some View {
        Image(Resource.Icon.people)
            .resizable()
            .frame(width: 44, height: 44)
            .padding(.trailing)
            
    }
    
    private var locationSection: some View {
        HStack(alignment: .top) {
            Image(Resource.Icon.location)
                .resizable()
                .frame(width: 24, height: 24)
            VStack(alignment: .leading, spacing: 3) {
                Text("Санкт-Петербург")
                    .font(.system(size: 18, weight: .medium))
                Text("12 августа, 2023")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.gray)
            }
        }
        .padding(.leading)
    }
}
