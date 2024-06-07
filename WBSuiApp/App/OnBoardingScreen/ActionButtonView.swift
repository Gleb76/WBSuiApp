//
//  ActionButtonView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 6.06.24.
//

import SwiftUI

struct ActionButtonView: View {
    @Binding var showOnboarding: Bool
    
    var body: some View {
        Button(action: {
            showOnboarding.toggle()
        }) {
            Text("Начать общаться")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.wbDefaultPurple)
                .cornerRadius(30)
        }
        .padding(.horizontal)
        .padding(.bottom, 20)
    }
}

// #Preview {
//     ActionButtonView(showOnboarding: .constant(false))
// }
