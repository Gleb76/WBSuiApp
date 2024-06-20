//
//  TabBarItem.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 14.06.24.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedIndex: Int
    let tabBarImages = ["Persons.black", "chat.black", "settings.black"]
    let usingTabBarImages = ["Persons.purple", "chat.purple", "settings.purple"]

    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(0..<usingTabBarImages.count) { index in
                    Button(action: {
                        selectedIndex = index
                    }, label: {
                        VStack {
                            Image(selectedIndex == index ? usingTabBarImages[index] : tabBarImages[index])
                                .resizable()
                                .frame(width: 58, height: 44)
                                .foregroundColor(selectedIndex == index ? .wbDefaultPurple : .gray)
                        }
                    })
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 50)
            .background(Color.white.shadow(radius: 2))
        }
        .ignoresSafeArea()
    }
}
