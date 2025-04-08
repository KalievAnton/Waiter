//
//  CategoeyListView.swift
//  Waiter
//
//  Created by Влад Мади on 03.04.2025.
//

import SwiftUI

struct CategoryListView: View {
    @State var viewModel = CategoryListViewModel()
    @State private var newCategoryTitle = ""
    @State private var showAddCategoryAlert = false
    
    var body: some View {
        
        VStack {
            Button("Новая категория") {
                showAddCategoryAlert = true
            }
            .padding()
            List(viewModel.categories) { categ in
                Text(categ.title)
            }
            .overlay {
                VStack {
                    Text("Новая категория").bold()
                    RoundedTextField(text: $newCategoryTitle,
                                     placeholder: "Название категории",
                                     hasEye: false)
                    RoundedButton(text: "Готово!") {
                        viewModel.createCategory(title: newCategoryTitle)
                        showAddCategoryAlert = false
                        newCategoryTitle.removeAll()
                        
                    }
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .shadow(radius: 3)
                }
                .padding()
                .offset(y: showAddCategoryAlert ? 0 : 1000)
                
            }
        }
    }
}

#Preview {
    CategoryListView()
}
