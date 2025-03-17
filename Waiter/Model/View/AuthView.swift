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
    @State private var isShow: Bool = false
    
    var body: some View {
        VStack {
            Image(R.Auth.logo)
                .frame(width: 150, height: (141))
            TextAuthCustom(text: R.Auth.title, isFont: false)
                .padding(.bottom,-5)
            Divider()
                .frame(width: 280, height: 1, alignment: .center)
                .background(.white)
            TextAuthCustom(text: R.Auth.subtitle, isFont: true)
                .padding(.bottom, 30)
            
            
            
            RoundedTextField(text: $viewModel.profile.name, placeholder: "Введите имя")
            RoundedTextField(text: $viewModel.profile.phone, placeholder: "Введите номер телефона")
            
            RoundedButton(text: isShow ? R.Auth.buttonEnter : R.Auth.buttonNext) {
                switch viewModel.isAuth {
                case true:
                    do {
                        try viewModel.checkNumber(number: viewModel.user.name)
                    } catch {
                        if let error = error as? MyError { viewModel.messageError = error }
                        isShow = true
                    }
                case false:
                    do {
                        try viewModel.checkPin(pin: viewModel.user.phone)
                        coordinator.appState = .authorized(user: viewModel.user)
                    } catch {
                        if let error = error as? MyError { viewModel.messageError = error }
                        isShow = true
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
        
        .alert(viewModel.messageError?.localizedDescription ?? "", isPresented: $isShow) {
            Button("OK") { }
        } message: {
            Text(viewModel.messageError?.failureReason ?? "")
        }
    }
}

#Preview {
    AuthView(coordinator: .constant(Coordinator()))
}
