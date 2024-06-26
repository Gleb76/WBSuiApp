//
//  Provider.swift
//  ContactsWidgetExtension
//
//  Created by Глеб Клыга on 23.06.24.
//

import Foundation
import WidgetKit

struct Provider: TimelineProvider {
    typealias Entry = contactsEntry
    func placeholder(in context: Context) -> contactsEntry {
        contactsEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (contactsEntry) -> ()) {
        let entry = contactsEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [contactsEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = contactsEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
