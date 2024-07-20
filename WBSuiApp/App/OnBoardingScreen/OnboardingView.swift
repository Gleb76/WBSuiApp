//
//  ContentView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 5.06.24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var showOnboarding = false

    var body: some View {
        VStack {
            LogoView()
                .padding(.top, 45)
            TitleView()
                .padding(.top, 42)
            TermsOfServiceView()
                .padding(.top, 158)
            ActionButtonView(showOnboarding: $showOnboarding)
                .padding(.top, 15)
        }
        .padding()
//        .sheet(isPresented: $showOnboarding) {
//            TelephoneView(showOnboarding: $showOnboarding)
//        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

