//
//  CreateDishViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import Foundation

protocol SetDishVM {
    var title: String { get }
    var price: Int? { get }
    var description: String { get }
    var volume: String { get }
    var dishCategories: [DishCategory] { get }
    var selectedCategory: DishCategory { get }
}

@Observable
class UpdateDishViewModel: SetDishVM {
    var id: String = UUID().uuidString
    var title: String = ""
    var price: Int? = 0
    var description: String = ""
    var volume: String = ""
    var dishCategories: [DishCategory] = []
    var selectedCategory: DishCategory = .init(id: "", title: "")
    
    init() {
        getAllCategories()
    }
    
    func setDish() {
        Task {
            guard id.isEmpty else { return }
            guard let price else { return }
            guard !title.isEmpty else { return }
            guard !description.isEmpty else { return }
            guard !volume.isEmpty else { return }
            guard selectedCategory.id != "0" else { return }
            
            try await FirestoreService.setDish(
                Dish(id: id,
                     title: title,
                     price: price,
                     description: description,
                     volume: volume,
                     category: selectedCategory.id)
            )
        }
    }
    
    func getAllCategories() {
        Task {
            let categories = try await FirestoreService.getAllCategories()
            await MainActor.run {
                self.dishCategories = categories
            }
        }
    }
}

@Observable
class CreateDishViewModel: SetDishVM {
    var title: String = ""
    var price: Int?
    var description = ""
    var volume = ""
    var dishCategories: [DishCategory] = []
    var selectedCategory: DishCategory = .init(id: "0", title: "Выберите категорию")
    
    init() {
        getAllCategories()
    }
    
    func createDish() {
        Task {
            guard let price else { return }
            guard !title.isEmpty else { return }
            guard !description.isEmpty else { return }
            guard !volume.isEmpty else { return }
            guard selectedCategory.id != "0" else { return }
            
            try await FirestoreService.setDish(
                Dish(title: title,
                     price: price,
                     description: description,
                     volume: volume,
                     category: selectedCategory.id)
            )
        }
    }
    
    func getAllCategories() {
        Task {
            let categories = try await FirestoreService.getAllCategories()
            await MainActor.run {
                self.dishCategories = categories
            }
        }
    }
}

