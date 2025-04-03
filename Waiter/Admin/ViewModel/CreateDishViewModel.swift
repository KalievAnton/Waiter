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
//    var category: Category = .salads
    var categories: [DishCategory] = [.init(id: "0", title: "Выберите категорию"),
                                      .init(id: "1", title: "Салаты"),
                                      .init(id: "2", title: "Супы"),
                                      .init(id: "3", title: "Напитки") ]
    var dishCategory: DishCategory = .init(id: "0", title: "Выберите категорию")
    
    init() {
        //TODO: Получить все категории
    }
    
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
}
