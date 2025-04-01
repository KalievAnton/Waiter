//
//  ProductList.swift
//  Waiter
//
//  Created by Влад Мади on 01.04.2025.
//

import SwiftUI

struct ProductListView: View {
    @State private var viewModel = ProductListViewModel()
    @State private var showCreateDishView: Bool = false
    
    var body: some View {
        List(viewModel.dishes) { dish in
            Text(dish.title)
        }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Выйти", role: .destructive) {
                        
                    } .tint(.red)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        showCreateDishView.toggle()
                    }
                }
            }
            .navigationTitle("Меню")
            .sheet(isPresented: $showCreateDishView) {
                CreateDishView()
            }
    }
}

#Preview {
    ProductListView()
}
