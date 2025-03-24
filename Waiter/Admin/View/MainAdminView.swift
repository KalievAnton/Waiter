//
//  MainAdminView.swift
//  Waiter
//
//  Created by Anton Kaliev on 22.03.2025.
//

import SwiftUI

struct MainAdminView: View {
    @State var viewModel: MainAdminViewModel = .init()
    @Bindable var coordinator: Coordinator
    
    var body: some View {
        VStack {
            RoundedButton(text: "Выйти") {
                Task {
                    let result = await viewModel.signOut()
                    switch result {
                    case true: coordinator.appState = .unauthorized
                    case false: break
                    }
                }
            }
        }
    }
}

#Preview {
    MainAdminView(coordinator: .init())
}
