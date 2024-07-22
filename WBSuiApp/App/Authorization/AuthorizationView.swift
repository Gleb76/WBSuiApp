// AuthorizationView.swift
// WBSuiApp
//
// Created by Глеб Клыга on 20.07.24.
//

import SwiftUI
import UserNotifications

struct AuthorizationView: View {
    @StateObject private var viewModel = AuthorizationViewModel()

    var body: some View {
        VStack {
            Spacer()
            
            Text("Введите код")
                .font(.system(size: 29, weight: .bold))
                .padding(.bottom, 8)
            
            Text("Отправили код на номер")
                .font(.system(size: 16))
                .foregroundColor(.wbDarkTextBG)
            
            Text(viewModel.phoneNumber)
                .font(.system(size: 16))
                .padding(.bottom, 32)
            
            HStack(spacing: 12) {
                ForEach(viewModel.indices, id: \.self) { index in
                    ZStack {
                        if viewModel.enteredCode[index].isEmpty {
                            Image("Ellipse_Gray")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        OneTimeCodeTextField(text: $viewModel.enteredCode[index], tag: index, onTextChange: viewModel.handleTextChange)
                            .frame(width: 40, height: 40)
                    }
                }
            }
            .padding(.bottom, 32)
            
            Button(action: viewModel.submitCode) {
                Text("Продолжить")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(viewModel.isCodeComplete ? Color.purple : Color.gray)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(30)
                    .padding(.horizontal)
            }
            .padding(.bottom, 32)
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(viewModel.alertMessage))
            }
            
            Spacer()
            
            Button(action: viewModel.requestNewCode) {
                Text("Запросить код повторно")
                    .foregroundColor(.purple)
                    .font(.system(size: 16))
            }
        }
        .padding(.horizontal)
        .onAppear {
            viewModel.requestNotificationPermission()
        }
    }
}

#Preview {
    AuthorizationView()
}
