//
//  MainAdminView.swift
//  Waiter
//
//  Created by Anton Kaliev on 22.03.2025.
//

import SwiftUI

struct EmployeeListView: View {
    @State var viewModel: EmployeeListViewModel = .init()
    @Binding var coordinator: Coordinator
    @State var showStaffRegView = false
    
    var body: some View {
        List(viewModel.profiles) { profile in
            Text(profile.name)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Выйти", role: .destructive) {
                    Task {
                        let result = await viewModel.signOut()
                        await MainActor.run {
                            switch result {
                            case true: coordinator.appState = .unauthorized
                            case false: break
                            }
                        }
                    }
                }.tint(.red)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("", systemImage: "plus.circle") {
                    showStaffRegView = true
                }
            }
        }
        .sheet(isPresented: $showStaffRegView) {
            StaffRegistrationView(viewModel: .init())
        }
    }
}

#Preview {
    EmployeeListView(coordinator: .init(.constant(.some(.init())))!)
}
