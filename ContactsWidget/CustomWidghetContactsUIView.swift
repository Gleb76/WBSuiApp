//
//  CustomWidghetContactsUIView.swift
//  ContactsWidgetExtension
//
//  Created by Глеб Клыга on 23.06.24.
//

import SwiftUI

struct CustomWidghetContactsUIView: View {
    let contact: Contact
    var body: some View {
        HStack {
            if let profileImage = contact.profileImage {
                ZStack {
                    Image(profileImage)
                        .resizable()
                        .frame(width: 38, height: 38)
                        .padding(.trailing, 10)
                    
                    if contact.stories {
                        Image("Story")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .offset(CGSize(width: -5, height: 0))
                    }
                    
                    if contact.isOnline {
                        Image("Status")
                            .resizable()
                            .frame(width: 13, height: 13)
                            .offset(x: 16, y: -17)
                    }
                }
                .padding(.trailing, 10)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(contact.name)
                    .font(.headline)
                    .font(.system(size: 12))
                Text(contact.lastSeen)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
            }
            Spacer()
        }
        .padding()
    }
}
#Preview{
    CustomWidghetContactsUIView(contact: Contact(name: "Анастасия Иванова", lastSeen: "Last seen yesterday", profileImage: "anastasia", stories: true, isOnline: true))
}
