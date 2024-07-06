//
//  Constants.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 6.07.24.
//

import Foundation

struct Constants {
    static let locales: [Locale] = [
        Locale(identifier: "en_US"),
        Locale(identifier: "fr_FR"),
        Locale(identifier: "es_ES"),
        Locale(identifier: "de_DE"),
        Locale(identifier: "ru_RU")
    ]
    
    static let flags: [String] = ["🇺🇸", "🇫🇷", "🇪🇸", "🇩🇪", "🇷🇺"]
    
    static let dateStrings: [String: [String: String]] = [
        "en_US": [
            "Today": "Today",
            "Yesterday": "Yesterday",
            "Tomorrow": "Tomorrow",
            "The day before yesterday": "The day before yesterday",
            "The day after tomorrow": "The day after tomorrow"
        ],
        "fr_FR": [
            "Today": "Aujourd'hui",
            "Yesterday": "Hier",
            "Tomorrow": "Demain",
            "The day before yesterday": "Avant-hier",
            "The day after tomorrow": "Après-demain"
        ],
        "es_ES": [
            "Today": "Hoy",
            "Yesterday": "Ayer",
            "Tomorrow": "Mañana",
            "The day before yesterday": "Anteayer",
            "The day after tomorrow": "Pasado mañana"
        ],
        "de_DE": [
            "Today": "Heute",
            "Yesterday": "Gestern",
            "Tomorrow": "Morgen",
            "The day before yesterday": "Vorgestern",
            "The day after tomorrow": "Übermorgen"
        ],
        "ru_RU": [
            "Today": "Сегодня",
            "Yesterday": "Вчера",
            "Tomorrow": "Завтра",
            "The day before yesterday": "Позавчера",
            "The day after tomorrow": "Послезавтра"
        ]
    ]
}
