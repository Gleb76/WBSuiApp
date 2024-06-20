//
//  TabBarView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 12.06.24.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ContactsView(contacts: contacts)
                    .tag(0)
                Text("Tab Content 2")
                    .tag(1)
                Text("Tab Content 3")
                    .tag(2)
            }
            .overlay(alignment: .bottom) {
                CustomTabBar(selectedIndex: $selectedTab)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
