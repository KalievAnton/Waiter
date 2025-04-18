//
//  UpdateDishViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 15.04.2025.
//

import Foundation

@Observable
class UpdateDishViewModel: SetDishViewModel {
    var id: String = UUID().uuidString
    var title: String = ""
    var price: Int? = 0
    var description: String = ""
    var volume: String = ""
    var dishCategories: [DishCategory] = []
    var selectedCategory: DishCategory = .init(id: "", title: "")
    var categID = ""
    
    init(dish: Dish) {
        self.id = dish.id
        self.title = dish.title
        self.price = dish.price
        self.description = dish.description
        self.volume = dish.volume
        self.categID = dish.category
        
        getAllCategories()
    }
    
    func setDish() {
        Task {
            guard !id.isEmpty else { return }
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
                if let currentCategory = categories.first(where: { categ in
                    categ.id == self.categID
                }) {
                    self.selectedCategory = currentCategory
                }
            }
        }
    }
}
