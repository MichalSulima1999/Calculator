//
//  NumberButtonView.swift
//  Calculator
//
//  Created by Michael on 07/10/2023.
//

import SwiftUI

struct NumberButtonView: View {
    
    let text: String
    @Binding var inputText: String
    @Binding var alertVisible: Bool
    @Binding var alertTitle: String
    @Binding var alertMessage: String
    
    var body: some View {
        ButtonView(text: text) {
            if (inputText.hasPrefix("Result")) {
                inputText = ""
            }
            if Int(text) != nil {
                if (inputText.hasPrefix("0")) {
                    showAlert(title: "Wrong format", message: "Zero cannot be first number")
                    return
                }
                inputText += text
            } else {
                showAlert(title: "Not a number", message: "Not a number")
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        alertVisible = true
        alertTitle = title
        alertMessage = message
    }
}
