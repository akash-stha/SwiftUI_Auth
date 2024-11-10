//
//  RegisterButtonView.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-11-05.
//

import SwiftUI

struct RegisterButtonView: View {
    
    @Binding var showSignUp: Bool

    var action: () -> Void // Closure for resetting email and password

    var body: some View {
        Button {
            action() // Clear email and password
            withAnimation {
                showSignUp.toggle()
            }
        } label: {
            Text("Don't have an account? ")
                .foregroundColor(.gray)
            + Text("Register").bold()
        }
        .tint(.primary)
    }
}

#Preview {
    RegisterButtonView(showSignUp: .constant(false), action: {})
}
