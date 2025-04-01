//
//  StaffRegistrationViewModel.swift
//  Waiter
//
//  Created by Anton Kaliev on 30.03.2025.
//

import Foundation

@Observable
final class StaffRegistrationViewModel {
    var profile: Profile = .init(name: "", email: "", role: .waiter)
    var navigationTitle: String
    var role: Role?
    
    init() {
        self.navigationTitle = "Новый сотрудник"
    }
    
    func signUp(login: String, pass: String) {
        Task {
            let user = try await AuthService.createUser(email: login, password: pass)
            await MainActor.run { self.profile.id = user.uid }
            try await FirestoreService.createProfile(profile)
        }
    }
}
