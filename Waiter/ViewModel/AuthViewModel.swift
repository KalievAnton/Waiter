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
    var messageError: MyError?
    var isAuth = false
    weak var coordinator: Coordinator?
    
    func login() async throws -> Profile {
        return try await AuthService.signIn(email: email, password: password)
    }
    
    func registrationСheck() throws {
        guard !email.isEmpty && !password.isEmpty else { throw MyError.emptyField }
    }
    
    func handleAuthFlow(adminID: String) async {
        do {
            try registrationСheck()
            let profile = try await login()
            
            await MainActor.run {
                self.profile = profile
                if profile.id == adminID {
                    coordinator?.appState = .adminpanel
                } else {
                    coordinator?.appState = .authorized(userID: profile.id)
                }
            }
        } catch {
            await MainActor.run {
                if let error = error as? MyError {
                    self.messageError = error
                }
            }
        }
    }
}
