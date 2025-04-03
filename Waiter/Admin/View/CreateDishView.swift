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
            Picker("Категория", selection: $viewModel.category) {
                ForEach(Category.allCases, id: \.rawValue) {
                    Text($0.label.uppercased()).tag($0)
                }
            }
            RoundedTextField(text:  $viewModel.title,
                             placeholder: "Название",
                             hasEye: false)
            TextField("Цена", value: $viewModel.price, format: .number)
                .txtCreateDishStyle()
            RoundedTextField(text:  $viewModel.volume,
                             placeholder: "Объём",
                             hasEye: false)
            TextField("Описание", text: $viewModel.description)
                .txtCreateDishStyle()
            RoundedButton(text: "Сохранить") {
            // TODO: Сохранить на главном экране блюдо
            }
        }
            .padding(.horizontal, 32)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color.gray.ignoresSafeArea()
            }
    }
    
    func saveDish() {
        guard !viewModel.title.isEmpty ||
                viewModel.price != 0 ||
                !viewModel.volume.isEmpty ||
                !viewModel.description.isEmpty else { return }
    }
}

#Preview {
    CreateDishView()
}
