//
//  LogoView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 6.06.24.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("Illustration")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 262, height: 271)
    }
}

#Preview {
    LogoView()
}
