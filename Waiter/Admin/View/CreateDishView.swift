//
//  CreateDishView.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import SwiftUI

struct CreateDishView: View {
    @State private var viewModel = CreateDishViewModel()
    var body: some View {
        VStack {
            Text("Новое блюдо")
                .font(.title.bold())
                .padding(.bottom)
            RoundedTextField(text:  $viewModel.title,
                             placeholder: "Название",
                             hasEye: false)
            TextField("Цена", value: $viewModel.price, format: .number)
            RoundedTextField(text:  $viewModel.volume,
                             placeholder: "Объём",
                             hasEye: false)
            TextField("Описание", text: $viewModel.description)
            Picker("Категория", selection: $viewModel.category) {
                ForEach(Category.allCases, id: \.rawValue) {
                    Text($0.rawValue).tag($0)
                }
            }
        }
    }
}

#Preview {
    CreateDishView()
}
