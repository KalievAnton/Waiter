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
        case .authorized(let userID):
            NavigationStack {
                TableView(coordinator: $coordinator,
                          viewModel: .init(userID: userID))
                    .navigationTitle("Столы")
            }
        case .unauthorized:
            AuthView(coordinator: $coordinator)
        }
    }
}

enum AppState {
    case authorized(userID: String)
    case unauthorized
}

#Preview {
    RouteView()
}
