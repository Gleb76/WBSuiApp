// OneTimeCodeTextField.swift
// WBSuiApp
//
// Created by Глеб Клыга on 22.07.24.
//

import SwiftUI
import UIKit

struct OneTimeCodeTextField: UIViewRepresentable {
    @Binding var text: String
    var tag: Int
    var onTextChange: (String, Int) -> Void

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: OneTimeCodeTextField

        init(_ parent: OneTimeCodeTextField) {
            self.parent = parent
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)

            if newText.count == 1 {
                parent.text = newText
                parent.onTextChange(newText, parent.tag)
                if string.isEmpty {
                    textField.text = ""
                }
                return false
            } else if newText.isEmpty {
                parent.text = newText
                parent.onTextChange(newText, parent.tag)
                return false
            }
            return newText.count <= 1
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.borderStyle = .none
        textField.tag = tag
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
}
