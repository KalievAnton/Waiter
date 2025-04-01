//
//  OrderPosition.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import Foundation

struct OrderPosition: Identifiable {
    let id: String = .init()
    let productID: String
    let price: Int
    var count: Int
}
