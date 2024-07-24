//
//  ActionButtonView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 6.06.24.
//

import SwiftUI

public struct ActionButtonView: View {
    
    public init() {}
    
    public var body: some View {
        CustomButton(
            title: "Начать общаться",
            backgroundColor: .wbDefaultPurple,
            textColor: .white
        ) {
        }
        .padding(.horizontal)
        .padding(.bottom, 20)
    }
}
