//
//  ContentView.swift
//  Calculator
//
//  Created by Michael on 03/10/2023.
//

import SwiftUI

enum Operation {
    
    case none
    case add
    case subtract
    case multiply
    case divide
    case sin
}

struct Calculations {
    static func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    static func subtract(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
    
    static func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    static func divide(_ a: Int, _ b: Int) -> Double {
        if b == 0 {
            return Double.nan
        } else {
            return Double(a) / Double(b)
        }
    }
    
    static func calculateSin(_ a: Int) -> Double {
        return sin(Double(a))
    }
}

struct ContentView: View {
    
    @State private var number1: Int?
    @State private var number2: Int?
    @State private var operation = Operation.none
    @State private var alertVisible = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var inputText = ""
    
    var body: some View {
        VStack {
            Text("Kalkulator").font(.largeTitle)
            Spacer(minLength: 50)
            Text(inputText)
                .frame(width: 315, height: 60)
                .border(Color.black, width: 2)
            HStack {
                ForEach((1...3), id: \.self) {
                    NumberButtonView(text: "\($0)", inputText: $inputText, alertVisible: $alertVisible, alertTitle: $alertTitle, alertMessage: $alertMessage)
                }
            }
            .frame(height: 60)
            
            HStack {
                ForEach((4...6), id: \.self) {
                    NumberButtonView(text: "\($0)", inputText: $inputText, alertVisible: $alertVisible, alertTitle: $alertTitle, alertMessage: $alertMessage)
                }
            }
            .frame(height: 60)
            
            HStack {
                ForEach((7...9), id: \.self) {
                    NumberButtonView(text: "\($0)", inputText: $inputText, alertVisible: $alertVisible, alertTitle: $alertTitle, alertMessage: $alertMessage)
                }
            }
            .frame(height: 60)
            
            HStack {
                NumberButtonView(text: "0", inputText: $inputText, alertVisible: $alertVisible, alertTitle: $alertTitle, alertMessage: $alertMessage)
                OperationButtonView(text: "+", inputText: $inputText, number1: $number1, number2: $number2, operation: $operation, alertVisible: $alertVisible, alertTitle: $alertTitle, alertMessage: $alertMessage)
                OperationButtonView(text: "-", inputText: $inputText, number1: $number1, number2: $number2, operation: $operation, alertVisible: $alertVisible, alertTitle: $alertTitle, alertMessage: $alertMessage)
            }
            
            HStack {
                OperationButtonView(text: "*", inputText: $inputText, number1: $number1, number2: $number2, operation: $operation, alertVisible: $alertVisible, alertTitle: $alertTitle, alertMessage: $alertMessage)
                OperationButtonView(text: "/", inputText: $inputText, number1: $number1, number2: $number2, operation: $operation, alertVisible: $alertVisible, alertTitle: $alertTitle, alertMessage: $alertMessage)
                OperationButtonView(text: "sin", inputText: $inputText, number1: $number1, number2: $number2, operation: $operation, alertVisible: $alertVisible, alertTitle: $alertTitle, alertMessage: $alertMessage)
            }
            .frame(height: 60)
            
            Button(action: {
                calculate()
            }) {
                Text("Oblicz")
                    .font(.title2)
                    .frame(width: 315, height: 60)
                    .background(Color.white)
                    .border(Color.black, width: 2)
            }
        }
        .frame(height: 60)
        .alert(isPresented: $alertVisible) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage)
            )
        }
    }
    
    func calculate() {
        if (operation != Operation.sin) {
            if let num = Int(inputText) {
                number2 = num
            } else {
                showAlert(title: "Incorrect number", message: "Incorrect number")
            }
        }
        switch (operation) {
        case .none:
            showAlert(title: "Choose operation", message: "No operation was chosen")
            break
        case .add:
            if ((number1 != nil) && (number2 != nil)) {
                inputText = "Result: \(Calculations.add(number1!, number2!))"
            } else {
                showAlert(title: "Choose numbers", message: "Choose numbers")
            }
            break
        case .subtract:
            if ((number1 != nil) && (number2 != nil)) {
                inputText = "Result: \(Calculations.subtract(number1!, number2!))"
            } else {
                showAlert(title: "Choose numbers", message: "Choose numbers")
            }
            break
        case .multiply:
            if ((number1 != nil) && (number2 != nil)) {
                inputText = "Result: \(Calculations.multiply(number1!, number2!))"
            } else {
                showAlert(title: "Choose numbers", message: "Choose numbers")
            }
            break
        case .divide:
            if ((number1 != nil) && (number2 != nil)) {
                let result = Calculations.divide(number1!, number2!)
                if (result.isNaN) {
                    showAlert(title: "Division by 0", message: "Cannot divide by 0")
                } else {
                    inputText = "Result: \(Calculations.divide(number1!, number2!))"
                }
            } else {
                showAlert(title: "Choose numbers", message: "Choose numbers")
            }
            break
        case .sin:
            if ((number1 != nil)) {
                inputText = "Result: \(Calculations.calculateSin(number1!))"
            } else {
                showAlert(title: "Choose number", message: "Choose number")
            }
            break
        }
        operation = Operation.none
    }
    
    func showAlert(title: String, message: String) {
        alertVisible = true
        alertTitle = title
        alertMessage = message
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
