//
//  TermsOfServiceView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 6.06.24.
//

import SwiftUI

struct TermsOfServiceView: View {
    var body: some View {
        Text("Пользовательское соглашение")
            .font(.system(size: 14, weight: .regular))
            .frame(width: 212, height: 24)
            .foregroundStyle(.wbFont)
            .padding(.bottom, 10)
    }
}

#Preview {
    TermsOfServiceView()
}
