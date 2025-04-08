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
    @State private var showCategoryListView: Bool = false
    
    var body: some View {
        List(viewModel.sections, id: \.categoryID) { section in
            Section(viewModel.getCategoryTitleBy(categoryID: section.categoryID) ?? "----") {
                ForEach(section.dishes) { dish in
                    HStack {
                        Text(dish.title).bold()
                        Spacer()
                        Text(dish.volume)
                            .padding(8)
                        Text("\(dish.price) ₽")
                    }
                }
            }
        
        }
        .refreshable {
            viewModel.fetchDishes()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Выйти", role: .destructive) {
                    
                } .tint(.red)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("", systemImage: "list.bullet.circle") {
                    showCategoryListView.toggle()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("", systemImage: "plus.circle") {
                    showCreateDishView.toggle()
                }
            }
        }
        .navigationTitle("Меню")
        .sheet(isPresented: $showCreateDishView) {
            CreateDishView()
        }
        .sheet(isPresented: $showCategoryListView) {
            CategoryListView()
        }
    }
}

#Preview {
    ProductListView()
}
