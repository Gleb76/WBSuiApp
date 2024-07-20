//
//  ExampleView.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 6.06.24.
//

import SwiftUI

struct TelephoneView: View {
    @State private var tfText: String = ""
    @State private var dataArray: [String] = []
    @State private var tfStrokeColor: Bool = false
    @State private var tfFdColor: Bool = false
    @State private var showActionSheet: Bool = false
    @State private var errorMessage: Bool = false
    @State private var selectedCountryIndex: Int = 0
    @State private var showProgress: Bool = false
    @State private var showText: Bool = true

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Spacer()

                VStack(spacing: 10) {
                    Text("Введите номер телефона")
                        .font(.system(size: 29, weight: .bold))

                    Text("Мы вышлем код подтверждения на указанный номер")
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .foregroundColor(.wbDarkTextBG)
                }

                Spacer()

                if showText {
                    VStack {
                        HStack(spacing: 12) {
                            CountryPicker(selectedCountryIndex: $selectedCountryIndex)

                            TextField("000 000-00-00", text: $tfText, onEditingChanged: { editing in
                                withAnimation(.spring()) {
                                    tfStrokeColor = editing
                                    tfFdColor = editing
                                    errorMessage = false
                                }
                            })
                            .keyboardType(.numberPad)
                            .padding(.horizontal, 12)
                            .frame(width: 220, height: 44)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(tfStrokeColor ? Color.purple : Color.gray.opacity(0.5), lineWidth: 1)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.white)
                                    )
                            )
                        }
                        .padding(.horizontal)

                        Text("Номер телефона должен состоять из 10 цифр.")
                            .foregroundColor(.gray.opacity(0.5))
                            .font(.caption)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal)
                            .opacity(tfText.count == 10 ? 0 : 1)
                    }
                    .transition(.slide)
                }

                Spacer()

                if showProgress {
                    ProgressView()
                        .scaleEffect(1.5, anchor: .center)
                } else {
                    Button(action: {
                        if tfText.count == 10 {
                            withAnimation {
                                showText = false
                                showProgress = true
                            }
                            addPhone()
                        } else {
                            errorMessage = true
                        }
                    }) {
                        Text("Продолжить")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(tfText.count == 10 ? Color.purple : Color.gray)
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(30)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 32)
                }
            }
            .padding(.top, 10)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }

    func addPhone() {
        dataArray.append(tfText)
        tfText = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                showText = true
                showProgress = false
            }
        }
    }
}

#Preview {
    TelephoneView()
}
