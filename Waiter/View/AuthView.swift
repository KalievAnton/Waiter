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
    @State private var isShowAlert: Bool = false
    
    var body: some View {
        VStack {
            Image(R.Auth.logo)
                .frame(width: 150, height: (141))
            TextAuthCustom(text: R.Auth.title, isFont: false)
            Divider()
                .frame(width: 270, height: 1, alignment: .center)
                .background(.white)
                .padding(.top, -8)
            TextAuthCustom(text: R.Auth.subtitle, isFont: true)
            TextField("Введите имя сотрудника", text: $viewModel.user.number)
                .tfAuthStyle().padding(.top, 40)
            if !viewModel.isAuth {
                SecureField("Введите пин-код", text: $viewModel.user.pin)
                    .tfAuthStyle()
            }
            
            RoundedButton(text: viewModel.isAuth ? "Далее" : "Войти") {
                switch viewModel.isAuth {
                case true:
                    do {
                        try viewModel.checkNumber(number: viewModel.user.number)
                    } catch {
                        if let error = error as? MyError { viewModel.messageError = error }
                        isShowAlert = true
                    }
                case false:
                    do {
                        try viewModel.checkPin(pin: viewModel.user.pin)
                        coordinator.appState = .authorized(user: viewModel.user)
                    } catch {
                        if let error = error as? MyError { viewModel.messageError = error }
                        isShowAlert = true
                    }
                }
            }
        }
        .padding(.horizontal, 48)
        .offset(y: -100)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.primary.ignoresSafeArea()
        }
      
        .animation(.bouncy, value: viewModel.isAuth)
        
        .alert(viewModel.messageError?.localizedDescription ?? "", isPresented: $isShowAlert) {
            Button("OK") { }
        } message: {
            Text(viewModel.messageError?.failureReason ?? "")
        }
    }
}

#Preview {
    AuthView(coordinator: .constant(Coordinator()))
}
