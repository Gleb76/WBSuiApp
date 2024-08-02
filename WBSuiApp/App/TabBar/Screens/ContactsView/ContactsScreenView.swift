//  ContactsScreenView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 20.06.24.
//

import SwiftUI

struct ContactsScreenView: View {
    let contact: Contact
    @StateObject private var imageLoader = AsyncImageLoader()
    
    var body: some View {
        HStack {
            if let profileImage = contact.profileImage {
                ZStack {
                    if let image = imageLoader.image {
                        image
                            .resizable()
                            .frame(width: 48, height: 48)
                            .padding(.trailing, 10)
                    } else {
                        Rectangle()
                            .foregroundColor(Color.gray)
                            .frame(width: 48, height: 48)
                            .padding(.trailing, 10)
                            .onAppear {
                                imageLoader.loadImage(from: profileImage)
                            }
                    }
                    
                    if contact.stories {
                        Image("Story")
                            .resizable()
                            .frame(width: 55, height: 55)
                            .offset(CGSize(width: -5, height: 0))
                    }
                    
                    if contact.isOnline {
                        Image("Status")
                            .resizable()
                            .frame(width: 17, height: 17)
                            .offset(x: 18, y: -19)
                    }
                }
                .padding(.trailing, 10)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(contact.name)
                    .font(.headline)
                Text(contact.lastSeen)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContactsScreenView(contact: Contact(name: "Анастасия Иванова", lastSeen: "Last seen yesterday", profileImage: "anastasia", stories: true, isOnline: true))
}

