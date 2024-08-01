//
//  Models.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 29.07.24.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool

    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }

    func updateCompletion() -> ItemModel {
        ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

class NoteSingle {
    static let shared = NoteSingle()
    private init() {}
    
    var notes: [ItemModel] = []
}
