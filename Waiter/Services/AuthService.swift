//
//  AuthService.swift
//  Waiter
//
//  Created by Anton Kaliev on 14.03.2025.
//

import Foundation
import FirebaseAuth

actor AuthService {
    static let auth = Auth.auth()
    static var currentUser: User? { auth.currentUser }
    
    static func createUser(email: String, password: String) async throws -> User {
        let result = try await auth.createUser(withEmail: email, password: password)
        let user = result.user
        return user
    }
    
    static func signIn(email: String, password: String) async throws -> Profile {
        do {
            let result = try await auth.signIn(withEmail: email, password: password)
            let user = result.user
            let profile = try await FirestoreService.fetchProfile(id: user.uid)
            return profile
        } catch {
            throw error
        }
    }
    
    static func signOut() async -> Bool {
        do {
            try auth.signOut()
            return true
        } catch {
            return false
        }
    }
}
