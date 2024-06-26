//
//  ContactsWidget.swift
//  ContactsWidget
//
//  Created by Глеб Клыга on 23.06.24.
//

import WidgetKit
import SwiftUI


struct contactsEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct ContactsWidget: Widget {
    let kind: String = "ContactsWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                ContactsWidgetUIView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                ContactsWidgetUIView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemMedium) {
    ContactsWidget()
} timeline: {
    contactsEntry(date: .now, emoji: "😀")
    contactsEntry(date: .now, emoji: "🤩")
}
