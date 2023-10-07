//
//  OperationButtonView.swift
//  Calculator
//
//  Created by Michael on 07/10/2023.
//

import SwiftUI

struct OperationButtonView: View {
    
    let text: String
    @Binding var inputText: String
    @Binding var number1: Int?
    @Binding var number2: Int?
    @Binding var operation: Operation
    @Binding var alertVisible: Bool
    @Binding var alertTitle: String
    @Binding var alertMessage: String
    
    var body: some View {
        ButtonView(text: text) {
            switch (text) {
            case "+":
                setOperation(operationToSet: Operation.add)
                break
            case "-":
                setOperation(operationToSet: Operation.subtract)
                break
            case "*":
                setOperation(operationToSet: Operation.multiply)
                break
            case "/":
                setOperation(operationToSet: Operation.divide)
                break
            case "sin":
                setOperation(operationToSet: Operation.sin)
                break
            default:
                showAlert(title: "Not a valid operation", message: "Not a valid operation")
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        alertVisible = true
        alertTitle = title
        alertMessage = message
    }
    
    func setOperation(operationToSet: Operation) {
        operation = operationToSet
        if let num = Int(inputText) {
            number1 = num
            inputText = ""
        } else {
            showAlert(title: "Incorrect number", message: "Incorrect number")
        }
    }
}
