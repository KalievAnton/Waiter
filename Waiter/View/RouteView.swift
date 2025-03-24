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
        case .unauthorized:
            AuthView(coordinator: $coordinator)
        case .authorized(let userID):
            NavigationStack {
                TableView(coordinator: $coordinator,
                          viewModel: .init(userID: userID))
                    .navigationTitle("Столы")
            }
        case .adminpanel:
            NavigationStack {
                MainAdminView(coordinator: .init())
            }
        }
    }
}

enum AppState {
    case authorized(userID: String)
    case unauthorized
    case adminpanel
}

#Preview {
    RouteView()
}
