//
//  AuthViewModel.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import Foundation
import SwiftUI

@Observable
final class AuthViewModel {
//    var profile: Profile = .init(name: "", phone: "", role: .admin)
    var role: Role?
    var name: String = ""
    var phone: String = ""
    var messageError: MyError?
    private let pinSuccses = "1234"
    var isAuth = false
    var showOrders = false
    weak var coordinator: Coordinator?
    
    func checkNumber(number: String) throws {
        guard !number.isEmpty else { throw MyError.emptyField }
        guard number.count == 11 else { throw MyError.invalidNumber }
        for char in number {
            guard char.isNumber else { throw MyError.invalidNumber }
        }
    }
    
    func checkPin(pin: String) throws {
        guard !pin.isEmpty else { throw MyError.emptyField }
        guard pin == pinSuccses else { throw MyError.invalidName }
        showOrders = false
    }
    
}
