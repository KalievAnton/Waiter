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
    @State private var confirmPass: String = ""

    var body: some View {
        VStack {
            CustomDropdown(role: $viewModel.role)
            RoundedTextField(text: $viewModel.profile.name,
                             placeholder: "Введите имя сотрудника",
                             hasEye: false)
            RoundedTextField(text: $viewModel.profile.email,
                             placeholder: "Введите почту сотрудника",
                             hasEye: false)
            RoundedTextField(text: $password,
                             placeholder: "Введите пароль",
                             hasEye: true)
            RoundedTextField(text: $confirmPass,
                             placeholder: "Повторите пароль",
                             hasEye: true)
            RoundedButton(text: "Сохранить") {
                signUp()
            }
        }
        .padding(.horizontal, 32)
        .frame(maxHeight: .infinity)
        .background {
            Color.gray.ignoresSafeArea()
        }
    }
    
    func signUp() {
        guard password == confirmPass else { return }
        viewModel.signUp(login: viewModel.profile.email, pass: password)
    }
}
