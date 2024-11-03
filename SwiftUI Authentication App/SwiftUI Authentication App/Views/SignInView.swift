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
    
    var body: some View {
        VStack(spacing: 20) {
            TopView(title: "Welcome Back", details: "Please login to your account.")
                    
            VStack(spacing: 35) {
                InfoTFView(title: "Email", text: $email)
                PasswordTFView(title: "Password", secureText: $password)
                HStack {
                    Toggle(isOn: $remember) {
                        Text("Remember me here")
                    }
                    .toggleStyle(RememberMeView())
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Forgot Password?")
                    }
                    .tint(.primary)

                }
                .padding(.horizontal, 10)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .animation(.spring(), value: email)
    }
}

#Preview {
    SignInView()
}
