//
//  StringInterpolation.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 4.07.24.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Int) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        if let result = formatter.string(from: value as NSNumber) {
            appendLiteral(result)
        }
    }
    
    mutating func appendInterpolation(_ value: Date, locale: Locale, spellOut: Bool = false) {
        if spellOut {
            let calendar = Calendar.current
            let dateComponents = calendar.dateComponents([.year, .month, .day], from: value)
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .spellOut
            numberFormatter.locale = locale
            
            var spelledOutDateComponents = [String]()
            
            if let day = dateComponents.day {
                let dayString = dayNameForNumber(day, locale: locale)
                spelledOutDateComponents.append(dayString)
            }
            
            if let month = dateComponents.month {
                let monthName = monthNameForNumber(month, locale: locale)
                spelledOutDateComponents.append(monthName)
            }
            
            if let year = dateComponents.year, let yearString = numberFormatter.string(from: NSNumber(value: year)) {
                spelledOutDateComponents.append(yearString)
            }
            
            let result = spelledOutDateComponents.joined(separator: " ")
            appendLiteral(result)
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            formatter.locale = locale
            
            let dateString = formatter.string(from: value)
            appendLiteral(dateString)
        }
    }
    
    private func dayNameForNumber(_ day: Int, locale: Locale) -> String {
        if locale.languageCode == "ru" {
            let declensions = ["первое", "второе", "третье", "четвертое", "пятое",
                               "шестое", "седьмое", "восьмое", "девятое", "десятое",
                               "одиннадцатое", "двенадцатое", "тринадцатое", "четырнадцатое",
                               "пятнадцатое", "шестнадцатое", "семнадцатое", "восемнадцатое",
                               "девятнадцатое", "двадцатое", "двадцать первое", "двадцать второе",
                               "двадцать третье", "двадцать четвертое", "двадцать пятое",
                               "двадцать шестое", "двадцать седьмое", "двадцать восьмое",
                               "двадцать девятое", "тридцатое", "тридцать первое"]
            
            if day >= 1 && day <= 31 {
                return declensions[day - 1]
            } else {
                return "\(day)"
            }
        } else {
            let dayFormatter = DateFormatter()
            dayFormatter.locale = locale
            dayFormatter.dateFormat = "d"
            let dateComponents = DateComponents(calendar: Calendar.current, day: day)
            return dayFormatter.string(from: dateComponents.date!)
        }
    }
    
    private func monthNameForNumber(_ month: Int, locale: Locale) -> String {
        if locale.languageCode == "ru" {
            let months = ["января", "февраля", "марта",
                          "апреля", "мая", "июня",
                          "июля", "августа", "сентября",
                          "октября", "ноября", "декабря"]
            
            if month >= 1 && month <= 12 {
                return months[month - 1]
            } else {
                return "\(month)"
            }
        } else {
            let monthFormatter = DateFormatter()
            monthFormatter.locale = locale
            monthFormatter.dateFormat = "LLLL"
            let dateComponents = DateComponents(calendar: Calendar.current, month: month)
            return monthFormatter.string(from: dateComponents.date!)
        }
    }
}
