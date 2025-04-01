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
    var userID: String
    
    init(userID: String) {
        self.userID = userID
        self.navigationTitle = "Новый сотрудник"
    }
    
    func fetchProfile() {
        Task {
            let profile = try await FirestoreService.fetchProfile(id: userID)
            await MainActor.run {
                self.profile = profile
            }
        }
    }
}
