//
//  SignInView.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-10-27.
//

import SwiftUI

struct SignInView: View {
    
    @State var isTextFieldActive: Bool = false
    @Binding var email: String
    @Binding var password: String
    @Binding var remember: Bool
    @Binding var showSignUp: Bool
    @State var showForgotPassword: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            TopView(title: "Welcome Back", details: "Please login in to your account.")
            InfoTFView(title: "Email", text: $email)
                .padding(.top, isTextFieldActive ? 15 : 0)
                .onReceive(NotificationCenter.default.publisher(for: .textFieldFocused)) { _ in
                    isTextFieldActive = true
                }
                .onReceive(NotificationCenter.default.publisher(for: .textFieldUnfocused)) { _ in
                    isTextFieldActive = false
                }
            VStack {
                PasswordTFView(title: "Password", text: $password)
            }
            Spacer()
        }
        .animation(.spring, value: isTextFieldActive)
    }
    
}

#Preview {
    SignInView(email: .constant(""), password: .constant(""), remember: .constant(true), showSignUp: .constant(true))
}
