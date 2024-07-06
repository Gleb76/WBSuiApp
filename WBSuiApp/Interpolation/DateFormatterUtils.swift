//
//  DateFormatterUtils.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 6.07.24.
//

import Foundation

struct DateFormatterUtils {
    
    static func formattedDateString(from date: Date, locale: Locale, spellOut: Bool, selectedDate: Date) -> String {
        let calendar = Calendar.current
        
        if calendar.isDate(date, inSameDayAs: selectedDate) {
            return localizedString(forKey: "Today", locale: locale) + " (\(date, locale: locale, spellOut: spellOut))"
        } else if calendar.isDate(date, inSameDayAs: calendar.date(byAdding: .day, value: -1, to: selectedDate)!) {
            return localizedString(forKey: "Yesterday", locale: locale) + " (\(date, locale: locale, spellOut: spellOut))"
        } else if calendar.isDate(date, inSameDayAs: calendar.date(byAdding: .day, value: 1, to: selectedDate)!) {
            return localizedString(forKey: "Tomorrow", locale: locale) + " (\(date, locale: locale, spellOut: spellOut))"
        } else if let dayDiff = calendar.dateComponents([.day], from: selectedDate, to: date).day {
            switch dayDiff {
            case -2:
                return localizedString(forKey: "The day before yesterday", locale: locale) + " (\(date, locale: locale, spellOut: spellOut))"
            case 2:
                return localizedString(forKey: "The day after tomorrow", locale: locale) + " (\(date, locale: locale, spellOut: spellOut))"
            default:
                return "\(date, locale: locale, spellOut: spellOut)"
            }
        }
        
        return "\(date, locale: locale, spellOut: spellOut)"
    }
    
    static func localizedString(forKey key: String, locale: Locale) -> String {
        let identifier = locale.identifier
        return Constants.dateStrings[identifier]?[key] ?? key
    }
}

