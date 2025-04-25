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
    @State private var showUpdateDishView: Bool = false
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(viewModel.productsVM.categories) { category in
                        Text(category.title)
                            .padding(8)
                            .padding(.horizontal, 8)
                            .background(category.id == viewModel.selectedCategory?.id ? Color.green : Color.gray)
                            .clipShape(.capsule)
                            .onTapGesture {
                                if category.id != viewModel.selectedCategory?.id {
                                    viewModel.selectCategory(category)
                                } else {
                                    viewModel.selectCategory(nil)
                                }
                            }
                    }
                    .padding(.horizontal, 8)
                }
            }
            List(viewModel.productsVM.sections, id: \.categoryID) { section in
                Section(viewModel.productsVM.getCategoryTitleBy(categoryID: section.categoryID) ?? "----") {
                    ForEach(section.dishes) { dish in
                        HStack {
                            Text(dish.title).bold()
                            Spacer()
                            Text(dish.volume)
                                .padding(8)
                            Text("\(dish.price) ₽")
                                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                    Button("Изменить") {
                                        viewModel.currentDish = dish
                                        showUpdateDishView = true
                                    }
                                }
                        }
                    }
                }
            }
            .searchable(text: $viewModel.productsVM.searchText, prompt: "Поиск блюд")
            .refreshable {
                viewModel.productsVM.fetchDishes()
            }
            .onChange(of: viewModel.productsVM.searchText) {
                viewModel.productsVM.search()
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
                SetDishView(viewModel: CreateDishViewModel())
            }
            .sheet(isPresented: $showCategoryListView) {
                CategoryListView()
            }
            .sheet(isPresented: $showUpdateDishView, content: {
                SetDishView(viewModel: UpdateDishViewModel(dish: viewModel.currentDish))
            })
        }
    }
}

#Preview {
    ProductListView()
}
