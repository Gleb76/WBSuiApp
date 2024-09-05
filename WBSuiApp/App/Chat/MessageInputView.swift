//
//  MessageInputView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 12.06.24.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    var onSend: () -> Void
    var onAddMedia: () -> Void

    var body: some View {
        HStack {
            Button(action: onAddMedia) {
                Image("plus")
                    .padding()
                    .cornerRadius(25)
            }

            TextField("Введите сообщение...", text: $messageText)
                .padding(12)
                .background(Color.white)
                .cornerRadius(25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal, 10)

            Button(action: onSend) {
                Image("arrowChat")
                    .padding()
                    .cornerRadius(25)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(25)
    }
}
