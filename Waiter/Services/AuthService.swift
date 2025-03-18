//
//  AuthService.swift
//  Waiter
//
//  Created by Anton Kaliev on 14.03.2025.
//

import Foundation
import FirebaseAuth

actor AuthService {
    static var authPhone = PhoneAuthProvider.provider()
    static let auth = Auth.auth()
    static var currentUser: User? { auth.currentUser }
    
    static func sendCode(phoneNumber: String) async throws {
        let verification = try await authPhone.verifyPhoneNumber(phoneNumber, uiDelegate: nil)
       
    }
//    static func createUser(name: String, phone: String) async throws -> Profile {
//        let result = try await auth.credential(withVerificationID: "", verificationCode: "")
//        let user = result.user
//        let profile = try await FirestoreService.createProfile(user: user)
//        return profile
//    }
    
    static func signIn(name: String, phone: String) async throws -> Profile {
        let result = try await auth.signIn(withEmail: name, password: phone)
        let user = result.user
        let profile = try await FirestoreService.fetchProfile(id: user.uid)
        return profile
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
