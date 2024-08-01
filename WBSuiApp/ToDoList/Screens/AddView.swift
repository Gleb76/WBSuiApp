//
//  AddView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 29.07.24.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var listViewModel: ListViewModel
    @State private var newItemTitle: String = ""

    var body: some View {
        VStack {
            TextField("New item", text: $newItemTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color(.systemGray6))
                .cornerRadius(8)

            Button(action: {
                if !newItemTitle.isEmpty {
                    listViewModel.addItem(title: newItemTitle)
                    newItemTitle = ""
                }
            }) {
                Text("Add")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
        .navigationTitle("Add Item")
    }
}

#Preview {
    AddView(listViewModel: ListViewModel())
}
