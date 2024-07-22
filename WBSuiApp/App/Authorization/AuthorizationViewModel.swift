//
//  AuthorizationViewModel.swift
//  WBSuiApp
//
//  Created by Глеб Клыга on 22.07.24.
//

import SwiftUI

class AuthorizationViewModel: ObservableObject {
    @Published var enteredCode: [String] = Array(repeating: "", count: 4)
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var phoneNumber: String = "+7 999 999-99-99"
    
    private var verificationNotification = Notification(phoneNumber: "+7 999 999-99-99", code: "1234")
    private let codeLength = 4
    
    var isCodeComplete: Bool {
        return enteredCode.joined().count == codeLength
    }
    
    var indices: [Int] {
        Array(0..<codeLength)
    }

    func handleTextChange(_ text: String, _ tag: Int) {
        enteredCode[tag] = text
        
        if text.isEmpty {
            focusOnPreviousTag(tag)
        } else {
            focusOnNextTag(tag)
        }
    }
    
    func submitCode() {
        let code = enteredCode.joined()
        if code == verificationNotification.code {
            alertMessage = "Код введен правильно"
        } else {
            alertMessage = "Неверный код"
        }
        showAlert = true
    }
    
    func requestNewCode() {
        let newCode = NotificationsManager.shared.generateRandomCode(length: codeLength)
        verificationNotification = Notification(phoneNumber: phoneNumber, code: newCode)
        NotificationsManager.shared.addNotification(for: verificationNotification)
        print("Новый код: \(newCode)")
    }
    
    func requestNotificationPermission() {
        NotificationsManager.shared.requestNotificationPermission { granted in
            if granted {
                self.requestNewCode()
            }
        }
    }
    
    private func focusOnPreviousTag(_ tag: Int) {
        if tag > 0 {
            DispatchQueue.main.async {
                let previousTag = tag - 1
                if let previousResponder = UIApplication.shared.windows.first?.rootViewController?.view.viewWithTag(previousTag) {
                    previousResponder.becomeFirstResponder()
                }
            }
        }
    }
    
    private func focusOnNextTag(_ tag: Int) {
        if tag < codeLength - 1 {
            DispatchQueue.main.async {
                let nextTag = tag + 1
                if let nextResponder = UIApplication.shared.windows.first?.rootViewController?.view.viewWithTag(nextTag) {
                    nextResponder.becomeFirstResponder()
                }
            }
        }
    }
}
