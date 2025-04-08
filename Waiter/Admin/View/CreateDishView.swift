//
//  CreateDishView.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import SwiftUI

struct CreateDishView: View {
    @State private var viewModel = CreateDishViewModel()
    @State private var backgroundColor: Color = .black
    @Environment (\.dismiss) var dismiss
    
    init() {
        UISegmentedControl.appearance().tintColor = .white
    }
    
    var body: some View {
        VStack {
            Text("Новое блюдо")
                .font(.custom(.boldMontserrat, size: 32))
                .padding(.bottom)
                .foregroundStyle(Color.white)
            
            ScrollView {
                ForEach(viewModel.dishCategories) { categ in
                    HStack {
                        Text(categ.title.uppercased())
                            .foregroundStyle(viewModel.selectedCategory == categ ? .orange : .white)
                            .font(viewModel.selectedCategory == categ ? .custom(.boldMontserrat, size: 16) : .custom(.regularMontserrat, size: 16))
                            .frame(width: 300)
                    }
                    .onTapGesture {
                        viewModel.selectedCategory = categ
                    }
                }
            }.frame(width: 300, height: 150)
                .animation(.bouncy, value: viewModel.selectedCategory)
            
            RoundedTextField(text:  $viewModel.title,
                             placeholder: "Название",
                             hasEye: false)
            TextField("Цена",
                      value: $viewModel.price,
                      format: .number)
                .txtCreateDishStyle()
            RoundedTextField(text:  $viewModel.volume,
                             placeholder: "Объём",
                             hasEye: false)
            TextField("Описание", text: $viewModel.description)
                .txtCreateDishStyle()
            RoundedButton(text: "Сохранить") {
                viewModel.createDish()
                dismiss()
            }
        }
            .padding(.horizontal, 32)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.gray.ignoresSafeArea()
            }
    }
}

#Preview {
    CreateDishView()
}
