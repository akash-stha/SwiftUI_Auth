//
//  PasswordValidationView.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-11-04.
//

import SwiftUI

struct PasswordValidationView: View {
    
    // Bind to the password text from SignInView
    @Binding var text: String
    
    var progressColor: Color {
        text.count >= 8 ? .green : .gray
    }

    var body: some View {
        VStack {
            CheckText(text: "Minimum 8 characters", isChecked: text.count >= 8)
                .foregroundColor(progressColor)
                .frame(height: text.count > 0 ? 25 : 0) // Adjust height when text is empty
                .opacity(text.count > 0 ? 1 : 0) // Change opacity based on text count
                .animation(.spring(), value: text.count) // Animate changes smoothly
//                .animation(.easeInOut(duration: 0.6), value: text.count)
        }
    }
}

#Preview {
    PasswordValidationView(text: .constant(""))
}

struct CheckText: View {
    let text: String
    var isChecked: Bool
    var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                .contentTransition(.symbolEffect)
                .foregroundStyle(isChecked ? .green : .secondary)
            Text(text)
                .foregroundColor(isChecked ? .white : .secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        .padding([.top, .bottom], -40)
    }
}
