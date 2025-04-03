//
//  Dish.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

class Dish: Identifiable {
    let id: String
    var title: String
    let price: Int
    let description: String
    let volume: String
    let category: Category
    
    init(id: String = UUID().uuidString, title: String, price: Int, description: String, volume: String, category: Category) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.volume = volume
        self.category = category
    }
}

enum Category: String, CaseIterable {
    case reptiles
    case snack
    case salads
    case baseDishes
    case soups
    case sideDishes
    case desserts
    case bar
    case sauces
    case childrensMenu
    
    var label: String {
        switch self {
        case .reptiles: "Гады"
        case .snack: "Закуски"
        case .salads: "Салаты"
        case .baseDishes: "Основые блюда"
        case .soups: "Супы"
        case .sideDishes: "Гарниры"
        case .desserts: "Десерты"
        case .bar: "Бар"
        case .sauces: "Соусы"
        case .childrensMenu: "Меню для детей"
        }
    }
}

extension Dish {
    static var mockData: [Dish] {
        [
            .init(title: "Шашлык из свинины",
                  price: 400,
                  description: "Шашлык подается с овощами и соусом на выбор",
                  volume: "300 ГР",
                  category: .baseDishes),
            .init(title: "Шаурма",
                  price: 250,
                  description: "Шаурма из курицы в тонком лаваше собственного производства",
                  volume: "210 ГР",
                  category: .baseDishes),
            .init(title: "Пицца пепперони",
                  price: 500,
                  description: "На тонком тесте пицца 35 см",
                  volume: "400 ГР",
                  category: .baseDishes),
            .init(title: "Салат Цезарь",
                  price: 450,
                  description: "Фирменный салат где основной ингредиент предлагается на выбор",
                  volume: "280 ГР",
                  category: .salads),
            .init(title: "Морс",
                  price: 150,
                  description: "Морс собственного производства из смородины",
                  volume: "150 МЛ",
                  category: .bar)
        ]
    }
}

extension Dish {
    var representation: [String : Any] {
        var represent: [String : Any] = [:]
            represent["id"] = id
            represent["title"] = title
            represent["price"] = price
            represent["description"] = description
            represent["volume"] = volume
            represent["category"] = category.rawValue
            return represent
    }
}

extension Dish {
    convenience init?(_ data: [String: Any]) {
        guard let id = data["id"] as? String,
              let title = data["title"] as? String,
              let price = data["price"] as? Int,
              let description = data["description"] as? String,
              let volume = data["volume"] as? String,
              let categoryString = data["category"] as? String else { return nil }
        
        guard let category = Category(rawValue: categoryString) else { return nil }
        
        self.init(id: id,
                  title: title,
                  price: price,
                  description: description,
                  volume: volume,
                  category: category)
    }
}
