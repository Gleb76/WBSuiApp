//
//  AnimeListViewModel.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 6.08.24.
//

import SwiftUI
import AnimeAPI

class AnimeListViewModel: ObservableObject {
    @Published var animeTitles: [Title] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fetchAnimeTitles()
    }
    
    func fetchAnimeTitles() {
        isLoading = true
        errorMessage = nil
        
        TitleAPI.titleGet { data, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    print("API Error: \(error.localizedDescription)")
                    self.errorMessage = "Не удалось получить данные: \(error.localizedDescription)"
                } else if let data = data {
                    self.animeTitles = data.results
                }
            }
        }
    }
}
