//
//  ExampleView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 6.06.24.
//

import SwiftUI

struct ExampleView: View {
    @Binding var showOnboarding: Bool

    var body: some View {
        VStack {
            Text("Добро пожаловать!")
                .font(.system(size: 24, weight: .bold))
                .padding()

            Text("Здесь вы можете общаться с друзьями и близкими.")
                .font(.system(size: 18, weight: .regular))
                .multilineTextAlignment(.center)
                .padding()

            Spacer()

            Button(action: {
                showOnboarding = false
            }) {
                Text("Закрыть")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.wbDefaultPurple))
                    .cornerRadius(25)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .padding()
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView(showOnboarding: .constant(true))
    }
}
