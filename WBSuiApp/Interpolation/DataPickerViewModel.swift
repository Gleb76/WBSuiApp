//
//  DataPickerViewModel.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 4.07.24.
//

import Foundation

class DataPickerViewModel: ObservableObject {
    
    @Published var selectedDate: Date = Date()
    @Published var selectedLocale: Locale = Locale(identifier: "en_US")
    @Published var spellOut: Bool = true
    
    let locales = Constants.locales
    let flags = Constants.flags
    
    func getDates() -> [Date] {
        let calendar = Calendar.current
        return [
            calendar.date(byAdding: .day, value: -2, to: selectedDate)!,
            calendar.date(byAdding: .day, value: -1, to: selectedDate)!,
            selectedDate,
            calendar.date(byAdding: .day, value: 1, to: selectedDate)!,
            calendar.date(byAdding: .day, value: 2, to: selectedDate)!
        ]
    }
    
    func localizedString(forKey key: String) -> String {
        return DateFormatterUtils.localizedString(forKey: key, locale: selectedLocale)
    }
    
    func formattedDateString(from date: Date) -> String {
        return DateFormatterUtils.formattedDateString(from: date, locale: selectedLocale, spellOut: spellOut, selectedDate: selectedDate)
    }
}

