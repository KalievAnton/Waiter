//
//  ContentView.swift
//  Waiter
//
//  Created by Тони on 19.12.2024.
//

import SwiftUI

struct RouteView: View {
    @State var coordinator = Coordinator()
    
    var body: some View {
        switch coordinator.appState {
        case .authorized(let user):
            TableView(coordinator: $coordinator, viewModel: .init(user: user))
        case .unauthorized:
            AuthView(coordinator: $coordinator)
        }
    }
}

enum AppState {
    case authorized(user: User)
    case unauthorized
}
    
#Preview {
    RouteView()
}
