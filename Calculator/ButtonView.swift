//
//  ButtonView.swift
//  Calculator
//
//  Created by Michael on 05/10/2023.
//

import SwiftUI

struct ButtonView: View {
    
    let text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title2)
                .frame(width: 100, height: 60)
                .background(Color.white)
                .border(Color.black, width: 2)
        }
    }
}
