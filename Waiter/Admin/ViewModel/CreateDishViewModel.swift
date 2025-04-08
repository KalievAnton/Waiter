//
//  CreateDishViewModel.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import Foundation

@Observable
class CreateDishViewModel {
    var title: String = ""
    var price: Int?
    var description = ""
    var volume = ""
    var dishCategory: DishCategory
//    var categories: [String] = []
    
//    [.init(id: "0", title: "Выберите категорию"),
//                                      .init(id: "1", title: "Салаты"),
//                                      .init(id: "2", title: "Супы"),
//                                      .init(id: "3", title: "Напитки") ]
//    
//    var dishCategory: DishCategory = .init(title: "Выберите категорию")
    
    init() {
        dishCategory = DishCategory(id: "", title: "")
        createCategory()
    }
    
//    init(_ dishCategory: DishCategory) {
//        self.dishCategory = dishCategory
//    }
    
    func createDish() {
        Task {
            guard let price else { return }
            guard !title.isEmpty else { return }
            guard !description.isEmpty else { return }
            guard !volume.isEmpty else { return }
            guard dishCategory.id != "0" else { return }
            
            try await FirestoreService.setDish(Dish(title: title,
                                                    price: price,
                                                    description: description,
                                                    volume: volume,
                                                    category: dishCategory.id))
        }
    }
    
    func createCategory() {
        Task {
            try await FirestoreService.setDishCategory(dishCategory)
        }
    }
}
