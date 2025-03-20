//
//  AuthView.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import SwiftUI

struct AuthView: View {
    @Binding var coordinator: Coordinator
    @State private var viewModel = AuthViewModel()
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Image(R.Auth.logo)
                .frame(width: 150, height: (141))
            TextAuthCustom(text: R.Auth.title, isFont: false)
                .padding(.bottom, -5)
            Divider()
                .frame(width: 280, height: 1, alignment: .center)
                .background(.white)
            TextAuthCustom(text: R.Auth.subtitle, isFont: true)
                .padding(.bottom, 32)
            CustomDropdown(role: $viewModel.role)

            if viewModel.isAuth {
                RoundedTextField(text: $viewModel.name, placeholder: "Введите почту")
                RoundedTextField(text: $viewModel.phone, placeholder: "Введите пароль")
            }

            RoundedButton(text: viewModel.isAuth  ? R.Auth.buttonEnter : R.Auth.buttonNext) {
                switch viewModel.isAuth {
                case true:
                    do {
                        //TODO: Написать метод для проверки имени
                        try viewModel.checkNumber(number: viewModel.phone)
                    } catch {
                        if let error = error as? MyError { viewModel.messageError = error }
                        showAlert = true
                    }
                case false:
                    if viewModel.role != nil {
                        viewModel.isAuth = true
                    } else {
                        viewModel.messageError = .invalidRole
                        showAlert = true
                    }
                }
            }
        }
        .padding(.horizontal, 50)
        .offset(y: -50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.primary.ignoresSafeArea()
        }
      
        .animation(.bouncy, value: viewModel.isAuth)
        
        .alert(viewModel.messageError?.localizedDescription ?? "", isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text(viewModel.messageError?.failureReason ?? "")
        }
    }
}

#Preview {
    AuthView(coordinator: .constant(Coordinator()))
}
