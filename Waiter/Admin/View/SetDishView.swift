//
//  CreateDishView.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import SwiftUI

struct SetDishView: View {
    @State var viewModel: SetDishViewModel
    @State private var backgroundColor: Color = .black
    @Environment(\.dismiss) var dismiss
    @Namespace var namespace
    
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
                            .underline(true, color: viewModel.selectedCategory == categ ? .orange : .clear)
                            .foregroundStyle(viewModel.selectedCategory == categ ? .orange : .white)
                            .font(viewModel.selectedCategory == categ ?
                                .custom(.boldMontserrat, size: 18) :
                                    .custom(.regularMontserrat, size: 16))
                            .frame(width: 300)
                    }
                    .onTapGesture {
                            viewModel.selectedCategory = categ
                    }
                }
            }.frame(width: 300, height: 150)
                .animation(.bouncy, value: viewModel.selectedCategory)
                .scrollIndicators(.hidden)
            
            RoundedTextField(text: $viewModel.title,
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
                viewModel.setDish()
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

