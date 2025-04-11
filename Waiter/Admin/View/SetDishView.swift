//
//  CreateDishView.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import SwiftUI

struct SetDishView: View {
    @State var viewModel: SetDishVM
    @State private var backgroundColor: Color = .black
    @Environment(\.dismiss) var dismiss
    
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
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.clear)
                            .stroke(viewModel.selectedCategory == categ ?  Color.white : Color.clear, lineWidth: 0.5)
                    }
                    .onTapGesture {
                        viewModel.selectedCategory = categ
                    }
                }
            }.frame(width: 300, height: 150)
                .animation(.bouncy, value: viewModel.selectedCategory)
                .scrollIndicators(.hidden)
            
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

//#Preview {
//    SetDishView()
//}
