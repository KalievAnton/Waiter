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
    @State private var email: String = ""
    @State private var password: String = ""
    
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
                RoundedTextField(text: $viewModel.email, placeholder: "Введите почту", hasEye: false)
                RoundedTextField(text: $viewModel.password, placeholder: "Введите пароль", hasEye: true)
            }
            RoundedButton(text: viewModel.isAuth  ? R.Auth.buttonEnter : R.Auth.buttonNext) {
                switch viewModel.isAuth {
                case true:
                    viewModel.coordinator = coordinator
                    viewModel.login()
                case false:
                    if viewModel.role != nil {
                        viewModel.isAuth = true
                    } else {
                        viewModel.messageError = MyError.invalidRole.localizedDescription
                        viewModel.showAlert = true
                        if let profile = viewModel.profile {
                            coordinator.appState = .adminpanel
                            coordinator.appState = .authorized(userID: profile.id)
                        }
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
        .alert(viewModel.messageError ?? "", isPresented: $viewModel.showAlert) {
            Button("OK") { }
        }
//        message: {
//            Text((viewModel.messageError as? MyError)?.failureReason ?? "")
//        }
    }
}

#Preview {
    AuthView(coordinator: .constant(Coordinator()))
}
