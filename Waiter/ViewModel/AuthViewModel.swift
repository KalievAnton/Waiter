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
    var user = User()
    var messageError: MyError?
    private let numberSuccses = "1234"
    private let pinSuccses = "1234"
    var isAuth = true
    var showOrders = false
    weak var coordinator: Coordinator?
    
    func checkNumber(number: String) throws {
        guard !number.isEmpty else { throw MyError.emptyField }
        guard number == numberSuccses else { throw MyError.invalidNumber }
        isAuth = false
    }
    
    func checkPin(pin: String) throws {
        guard !pin.isEmpty else { throw MyError.emptyField }
        guard pin == pinSuccses else { throw MyError.invalidPin }
        showOrders = false
    }

    func logOut() {
        user.number = ""
        user.pin = ""
        
        withAnimation { showOrders = false }
    }
}
