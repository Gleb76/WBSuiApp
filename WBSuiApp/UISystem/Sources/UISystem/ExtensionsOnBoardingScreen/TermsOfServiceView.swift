//
//  TermsOfServiceView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 6.06.24.
//

import SwiftUI

public struct TermsOfServiceView: View {
    
    public init() {}
    
    public var body: some View {
        VStack{
            Spacer()
            Text("Нажимая кнопку продолжить я соглашаюсь с")
                .font(.system(size: 10, weight: .regular))
                .multilineTextAlignment(.center)
                .padding(.bottom, 4)
                .foregroundColor(.gray)

            HStack{
                Button(action: {
                    print("Print Policy tapped")
                }) {
                    Text("Политикой Конфиденциальности")
                        .font(.system(size: 10, weight: .regular))
                        .foregroundColor(.wbDefaultPurple)
                }

                Text("и")
                    .foregroundColor(.gray)
                    .font(.system(size: 10, weight: .regular))

                Button(action:{
                    print("Terms of Service tapped")
                }) {
                    Text("Условиями Использования")
                        .font(.system(size: 10, weight: .regular))
                        .foregroundColor(.wbDefaultPurple)
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    TermsOfServiceView()
}
