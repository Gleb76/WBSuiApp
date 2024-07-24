//
//  ContentView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 5.06.24.
//

import SwiftUI
import UISystem

struct OnboardingView: View {

    var body: some View {
        VStack {
            LogoView()
                .padding(.top, 140)
            TitleView()
                .padding(.top, 42)
            TermsOfServiceView()
                .padding(.top, 110)
            ActionButtonView()
                .padding(.bottom, 30)
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

