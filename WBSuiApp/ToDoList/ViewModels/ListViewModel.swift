//
//  ListViewModel.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 29.07.24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    var statusText = Dynamic("")

    init() {
        self.items = NoteSingle.shared.notes
    }

    func addItem(title: String) {
        let newItem = ItemModel(title: title)
        items.append(newItem)
        NoteSingle.shared.notes.append(newItem)
        statusText.value = "Item added"
    }

    func removeItem(at index: IndexSet) {
        items.remove(atOffsets: index)
        statusText.value = "Item removed"
    }

    func updateItemCompletion(id: String) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index] = items[index].updateCompletion()
            statusText.value = "Item updated"
        }
    }
}
