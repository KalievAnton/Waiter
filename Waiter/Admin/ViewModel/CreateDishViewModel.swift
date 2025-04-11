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
}

@Observable
class UpdateDishViewModel: SetDishVM {
    var title: String = ""
    var price: Int? = 0
    
    
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
            
            try await FirestoreService.setDish(Dish(title: title,
                                                    price: price,
                                                    description: description,
                                                    volume: volume,
                                                    category: selectedCategory.id))
        }
    }
    
    func getAllCategories() {
        Task {
            let categories = try await FirestoreService.getAllCategories()
            await MainActor.run {
                self.dishCategories = categories
                print(self.dishCategories.count)
            }
        }
    }
}

