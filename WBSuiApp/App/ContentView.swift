//
//  ContentView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 5.06.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("Illustration")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            Spacer()
            
            Text("Общайтесь с друзьями\nи близкими легко")
                .font(.sfProDisplay(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            
            Text("Пользовательское соглашение")
                .font(.sfProDisplay(size: 14))
                .foregroundColor(Color(hex: "#29183B"))
                .padding(.bottom, 10)
            
            Button(action: {
            }) {
                Text("Начать общаться")
                    .font(.sfProDisplay(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "#9A41FE"))
                    .cornerRadius(25)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
