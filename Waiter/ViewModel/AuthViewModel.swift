//
//  AuthViewModel.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation
import SwiftUI

@Observable
final class AuthViewModel {
    var profile: Profile?
    var role: Role?
    var email: String = ""
    var password: String = ""
    var messageError: String?
    var isAuth = false
    weak var coordinator: Coordinator?
    var showAlert = false
    
    func login() {
        Task {
            do {
                try registrationСheck()
                let profile = try await AuthService.signIn(email: email, password: password)
                await MainActor.run {
                    self.profile = profile
                    let adminID = coordinator?.adminID
                    if profile.id == adminID {
                        coordinator?.appState = .adminpanel
                    } else {
                        coordinator?.appState = .authorized(userID: profile.id)
                    }
                }
            } catch let error {
                await MainActor.run {
                    if let myError = error as? MyError {
                        self.messageError = myError.localizedDescription
                    } else if error.localizedDescription.contains("The email address is badly formatted") {
                        self.messageError = "Email имеет неверный формат"
                    } else if error.localizedDescription.contains("The supplied auth credential is malformed or has expired") {
                        self.messageError = "Неверный email или пароль"
                    } else {
                        self.messageError = "Неизвестная ошибка"
                    }
                    showAlert = true
                }
            }
        }
    }
    
    func registrationСheck() throws {
        guard !email.isEmpty && !password.isEmpty else { throw MyError.emptyField }
    }
}
