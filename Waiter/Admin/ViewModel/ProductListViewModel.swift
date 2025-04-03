//
//  ProductListViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import Foundation

@Observable
class ProductListViewModel {
    var dishes: [Dish] = []
    
    init() {
        fetchDishes()
    }
    
    func fetchDishes() {
        Task {
            let dishes = try await FirestoreService.getAllDishes()
            await MainActor.run {
                self.dishes = dishes
            }
        }
    }
}
