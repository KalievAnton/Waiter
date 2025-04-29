//
//  StatsView.swift
//  Waiter
//
//  Created by Влад Мади on 29.04.2025.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        VStack {
            NavigationLink("Заказы") {
                OrdersListView()
            }
        }
    }
}

#Preview {
    StatsView()
}
