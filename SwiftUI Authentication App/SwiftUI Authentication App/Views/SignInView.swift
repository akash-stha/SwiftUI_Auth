//
//  SignInView.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-10-27.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var remember: Bool = false
    @State private var showSignUp: Bool = false
    @State private var showForgotPassword: Bool = false
    @State private var shakeEmail: Bool = false
    @State private var shakePassword: Bool = false
    @State private var navigateToHome = false // New state for navigation
    
    var body: some View {
            VStack(spacing: 20) {
                TopView(title: "Welcome Back", details: "Please login to your account.")
                        
                VStack(spacing: 35) {
                    InfoTFView(title: "Email", text: $email)
                        .offset(x: shakeEmail ? -10 : 10) // Apply shake effect on offset
                        .animation(
                            .easeInOut(duration: 0.1).repeatCount(3, autoreverses: true),
                            value: shakeEmail
                        )
                        .padding(.trailing, 10)
                    
                    PasswordTFView(title: "Password", secureText: $password)
                        .offset(x: shakePassword ? -10 : 10) // Apply shake effect on offset
                        .animation(
                            .easeInOut(duration: 0.1).repeatCount(3, autoreverses: true),
                            value: shakePassword
                        )
                        .padding(.trailing, 10)
                    
                    PasswordValidationView(text: $password)
                    
                    HStack {
                        Toggle(isOn: $remember) {
                            Text("Remember me here")
                        }
                        .toggleStyle(RememberMeView())
                        
                        Spacer()
                        
                        Button {
                            // Forgot password action
                        } label: {
                            Text("Forgot Password?")
                        }
                        .tint(.primary)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, -50)
                    
                    SignInButtonView(title: "Log In") {
                        if !email.isEmpty && !password.isEmpty {
                            print("Email: \(email), Password: \(password)")
                        } else {
                            print("Enter valid credentials")
                            if email.isEmpty {
                                triggerShakeEffect(for: .email)
                            }
                            if password.isEmpty {
                                triggerShakeEffect(for: .password)
                            }
                        }
                    }
                    .padding(.top, 10)
                    
                    OrView()
                    
                    HStack(spacing: 70) {
                        SignInAccountsView(image: .apple, action: {})
                        SignInAccountsView(image: .google, action: {})
                        SignInAccountsView(image: .email, action: {})
                    }
                    
                    Spacer()
                    
                    RegisterButtonView(showSignUp: $showSignUp) {
                        email = ""
                        password = ""
                        hideKeyboard()
                    }
                }
                .padding(.top, 20)
                
                Spacer()
                
            }
    }
    
    private func triggerShakeEffect(for field: Field) {
        switch field {
        case .email:
            shakeEmail = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                shakeEmail = false
            }
        case .password:
            shakePassword = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                shakePassword = false
            }
        }
    }
    
    private enum Field {
        case email
        case password
    }
}

#Preview {
    SignInView()
}
