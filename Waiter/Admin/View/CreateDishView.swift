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
    
    init() {
        UISegmentedControl.appearance().tintColor = .white
    }
    
    var body: some View {
        VStack {
            Text("Новое блюдо")
                .font(.custom(.boldMontserrat, size: 32))
                .padding(.bottom)
                .foregroundStyle(Color.white)
            Picker("Категория", selection: $viewModel.dishCategory.title) {
                ForEach(viewModel.dishCategory) { categ in
                    Text(categ.title.uppercased()).tag(categ)
                }
            }
            .tint(.white)
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
