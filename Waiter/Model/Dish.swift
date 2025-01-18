//
//  Dish.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation

class Dish: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let price: Int
    let description: String
    var amount: Int = 0
    
    init(title: String, price: Int, description: String, amount: Int) {
        self.title = title
        self.price = price
        self.description = description
        self.amount = amount
    }
}

extension Dish {
    static var mockData: [Dish] {
        [
            .init(title: "Шашлык из свинины",
                  price: 400,
                  description: "Шашлык подается с овощами и соусом на выбор",
                  amount: 2),
            .init(title: "Шаурма",
                  price: 250,
                  description: "Шаурма из курицы в тонком лаваше собственного производства",
                  amount: 0),
            .init(title: "Пицца пепперони",
                  price: 500,
                  description: "На тонком тесте пицца 35 см",
                  amount: 0),
            .init(title: "Салат Цезарь",
                  price: 450,
                  description: "Фирменный салат где основной ингредиент предлагается на выбор",
                  amount: 2),
            .init(title: "Морс",
                  price: 150,
                  description: "Морс собственного производства из смородины",
                  amount: 4)
        ]
    }
}
