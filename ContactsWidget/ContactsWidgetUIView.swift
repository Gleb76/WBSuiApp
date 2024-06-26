//
//  ContactsWidgetUIView.swift
//  ContactsWidgetExtension
//
//  Created by Глеб Клыга on 23.06.24.
//

import SwiftUI

struct ContactsWidgetUIView: View {
    var entry: Provider.Entry
    
    
    var body: some View {
        VStack {
            Text("Contacts:")
                .font(.title)
                .padding(.bottom, 10)
            ForEach(contacts, id: \.id) { contact in
                CustomWidghetContactsUIView(contact: contact)
                    .padding(.bottom, 10)
            }
        }
    }
}

