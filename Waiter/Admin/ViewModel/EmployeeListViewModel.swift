//
//  MainAdminViewModel.swift
//  Waiter
//
//  Created by Anton Kaliev on 22.03.2025.
//

import Foundation


@Observable
final class EmployeeListViewModel {
    var profiles: [Profile] = []
    
    func signOut() async -> Bool {
        await AuthService.signOut()
    }
    
    func getProfiles() {
        Task {
            let profiles = try await FirestoreService.fetchProfiles()
            await MainActor.run {
                self.profiles = profiles
            }
        }
    }
}
