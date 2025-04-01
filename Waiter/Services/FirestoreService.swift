//
//  FirestoreService.swift
//  Waiter
//
//  Created by Anton Kaliev on 14.03.2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

actor FirestoreService {
    static let database = Firestore.firestore()
    static var profilesRef: CollectionReference { database.collection("profiles") }
    
    @discardableResult
    static func createProfile(_ profile: Profile) async throws -> Profile {
        try await profilesRef.document(profile.id).setData(profile.representation)
        return profile
    }
    
    static func fetchProfile(id: String) async throws -> Profile {
        let snapshot = try await profilesRef.document(id).getDocument()
        guard let data = snapshot.data() else { throw MyError.invalidDocumentSnapshot }
        guard let profile = Profile(data) else { throw MyError.invalidDataInSnapshot }
        return profile
    }
    
    static func fetchProfiles() async throws -> [Profile] {
        let snapshot = try await profilesRef.getDocuments()
        let data = snapshot.documents
        return data
            .compactMap { Profile($0.data()) }
            .sorted { $0.name < $1.name }
    }
}
