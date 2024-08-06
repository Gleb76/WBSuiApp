//
//  CustomButton.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 24.07.24.
//

import SwiftUI

public struct CustomButton: View {
    public var title: String
    public var backgroundColor: Color
    public var textColor: Color
    public var action: () -> Void
    
    public init(title: String, backgroundColor: Color, textColor: Color, action: @escaping () -> Void) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.headline)
                .cornerRadius(30)
                .padding(.horizontal)
        }
    }
}

#Preview {
    CustomButton(title: "Продолжить", backgroundColor: .purple, textColor: .white, action: {})
        .previewLayout(.sizeThatFits)
}
