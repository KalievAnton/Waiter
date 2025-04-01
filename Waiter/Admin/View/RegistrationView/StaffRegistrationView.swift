//
//  StaffRegistrationView.swift
//  Waiter
//
//  Created by Anton Kaliev on 30.03.2025.
//

import SwiftUI

struct StaffRegistrationView: View {
    @State var viewModel: StaffRegistrationViewModel
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            CustomDropdown(role: $viewModel.role)
            RoundedTextField(text: $viewModel.profile.name, placeholder: "Введите имя сотрудника", hasEye: false)
            RoundedTextField(text: $viewModel.profile.email, placeholder: "Введите почту сотрудника", hasEye: false)
            RoundedTextField(text: $password, placeholder: "Введите пароль", hasEye: true)
            RoundedTextField(text: $password, placeholder: "Повторите пароль", hasEye: true)
            RoundedButton(text: "Сохранить") {
                viewModel.fetchProfile()
            }
        }
        .padding(.horizontal, 32)
        .frame(maxHeight: .infinity)
        .background {
            Color.primary.ignoresSafeArea()
        }
    }
}

#Preview {
    StaffRegistrationView(viewModel: .init(userID: ""))
}
