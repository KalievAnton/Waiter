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
    static var dishesRef: CollectionReference { database.collection("dishes") }
    static var dishCategoriesRef: CollectionReference { database.collection("categories") }
    static var tablesRef: CollectionReference { database.collection("tables") }
    static var ordersRef: CollectionReference { database.collection("orders") }


    //MARK: - TABLE
    static func fetchTables() async throws -> [Table] {
        let snapshot = try await tablesRef.getDocuments()
        let data = snapshot.documents
        return data
            .compactMap { Table(data: $0.data()) }
            .sorted { $0.number < $1.number }
    }
    
    static func fetchTable(byID id: String) async throws -> Table {
        let snapshot = try await tablesRef.document(id).getDocument()
        guard let table = Table(data: snapshot.data() ?? [:]) else { throw MyError.invalidDataInSnapshot }
        return table
    }
    
    @discardableResult
    static func createTable(_ table: Table) async throws -> Table {
        try await tablesRef.document(table.id).setData(table.representation)
        return table
    }
    
    static func deleteTable(_ table: Table) async throws {
        try await tablesRef.document(table.id).delete()
    }
    
    //MARK: - PROFILE
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
    
    //MARK: - DISH
    static func setDish(_ dish: Dish) async throws {
        try await dishesRef.document(dish.id).setData(dish.representation)
    }
    
    static func getAllDishes() async throws -> [Dish] {
        let allDishesSnapshot = try await dishesRef.getDocuments()
        let allDishesDocument = allDishesSnapshot.documents
        let allDishes = allDishesDocument.compactMap { snapshot in
            let data = snapshot.data()
            let dishes = Dish(data)
            return dishes
        }
        
        return allDishes
    }
    
    //MARK: - CATEGORY
    static func setDishCategory(_ dishCategory: DishCategory) async throws {
        try await dishCategoriesRef.document(dishCategory.id).setData(dishCategory.representation)
    }
    
    static func getAllCategories() async throws -> [DishCategory] {
        let allcategoriesSnapshot = try await dishCategoriesRef.getDocuments()
        let allcategoriesDocument = allcategoriesSnapshot.documents
        let allCategories = allcategoriesDocument.compactMap { snapshot in
            let data = snapshot.data()
            let categories = DishCategory(data)
            return categories
        }
        
        return allCategories
    }
    
    //MARK: - Orders
    static func setOrder(_ order: Order) async throws {
        try await ordersRef.document(order.id).setData(order.representation)
        let positionsPath = ordersRef.document(order.id).collection("positions")
        
        for position in order.positions {
            try await positionsPath.document(position.id).setData(position.representation)
        }
    }
    
    static func getOrder(byID id: String) async throws -> Order {
        let path = ordersRef.document(id)
        guard let data = try await path.getDocument().data() else { throw MyError.invalidDocumentSnapshot }
        guard var order = Order(data: data) else { throw MyError.invalidDataInSnapshot }
        let positionsSnapshot = try await path.collection("positions").getDocuments().documents
        for snap in positionsSnapshot {
            let data = snap.data()
            if let position = OrderPosition(data) {
                order.positions.append(position)
            }
        }
        return order
    }
    
    static func getAllOrders() async throws -> [Order] {
        let ordersSnap = try await ordersRef.getDocuments().documents
        return ordersSnap
                .compactMap { snap in Order(data: snap.data()) }
    }
}
