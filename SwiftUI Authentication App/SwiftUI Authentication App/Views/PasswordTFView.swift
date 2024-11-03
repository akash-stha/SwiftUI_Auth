//
//  PasswordTFView.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-10-27.
//

import SwiftUI

struct PasswordTFView: View {
    
    var title: String
    @Binding var secureText: String
    @FocusState var isActive: Bool
    @State var showPassword: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            
            if showPassword {
                TextField(isActive ? "Enter your password" : "", text: $secureText)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .background(Color.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 16))
                    .focused($isActive)
            } else {
                SecureField(isActive ? "Enter your password" : "", text: $secureText)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .background(Color.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 16))
                    .focused($isActive)
            }
            
            Text(title)
                .font(.system(size: 25))
                .padding(.horizontal, 10)
                .offset(y: (isActive || !secureText.isEmpty) ? -50 : 0)
                .scaleEffect((isActive || !secureText.isEmpty) ? 0.8 : 1.0, anchor: .leading)
                .animation(.spring(), value: isActive || !secureText.isEmpty)
                .onTapGesture {
                    isActive = true
                }
        }
        .padding(.horizontal, 10)
        .overlay(alignment: .trailing) {
            Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                .padding(16)
                .padding(.trailing, 10)
                .contentShape(Rectangle())
                .foregroundStyle(showPassword ? .primary : .secondary)
                .onTapGesture {
                    showPassword.toggle()
                }
        }
    }
}

#Preview {
    PasswordTFView(title: "Test", secureText: .constant(""))
}










/*
 import SwiftUI

 struct SignInView: View {
     
     @State private var email: String = ""
     @State private var password: String = ""
     @State private var remember: Bool = true
     @State private var showSignUp: Bool = false

     var body: some View {
         VStack(spacing: 20) {
             TopView(title: "Welcome Back", details: "Please login to your account.")
             
             // Email Text Field
             InfoTFView(title: "Email", text: $email)
                 .padding(.top, email.isEmpty ? 0 : 15)
             
             // Test Text Field
             InfoTFView(title: "Test123", text: $email)
                 .padding(.top, email.isEmpty ? 0 : 15)

             // Password Text Field
             PasswordTFView(title: "Password", text: $password)
             Spacer()
         }
         .animation(.spring(), value: email.isEmpty)
     }
 }

 #Preview {
     SignInView()
 }

 struct InfoTFView: View {
     
     var title: String
     @Binding var text: String
     @FocusState private var isActive: Bool
     
     var body: some View {
         ZStack(alignment: .leading) {
             // Conditional placeholder
             TextField(isActive ? "Enter your \(title.lowercased())" : "", text: $text)
                 .padding(.horizontal, 10)
                 .frame(maxWidth: .infinity, maxHeight: 55)
                 .background(Color.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 16))
                 .focused($isActive)
             
             // Title moving up and scaling when active or text is non-empty
             Text(title)
                 .font(.system(size: 25))
                 .padding(.horizontal, 10)
                 .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                 .scaleEffect((isActive || !text.isEmpty) ? 0.8 : 1.0, anchor: .leading)
                 .animation(.spring(), value: isActive || !text.isEmpty)
                 .onTapGesture {
                     isActive = true
                 }
         }
         .padding(.horizontal, 10)
     }
 }

 struct PasswordTFView: View {
     
     var title: String
     @Binding var text: String
     @FocusState private var isActive: Bool
     
     var body: some View {
         ZStack(alignment: .leading) {
             SecureField(isActive ? "Enter your password" : "", text: $text)
                 .padding(.horizontal, 10)
                 .frame(maxWidth: .infinity, maxHeight: 55)
                 .background(Color.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 16))
                 .focused($isActive)
             
             Text(title)
                 .font(.system(size: 25))
                 .padding(.horizontal, 10)
                 .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                 .scaleEffect((isActive || !text.isEmpty) ? 0.8 : 1.0, anchor: .leading)
                 .animation(.spring(), value: isActive || !text.isEmpty)
                 .onTapGesture {
                     isActive = true
                 }
         }
         .padding(.horizontal, 10)
     }
 }
 */

/*
 struct SignInView: View {
     
     @State private var email: String = ""
     @State private var password: String = ""
     @Binding var remember: Bool
     @Binding var showSignUp: Bool
     @State var showForgotPassword: Bool = false
     
     var body: some View {
         VStack(spacing: 20) {
             TopView(title: "Welcome Back", details: "Please login in to your account.")
             InfoTFView(title: "Email", text: $email)
                 .padding(.top, 15)
             PasswordTFView(title: "Password", text: $password)
                 .padding(.top, 15)
             Spacer()
         }
         .animation(.spring, value: email.isEmpty)
         .animation(.spring, value: password.isEmpty)
     }
     
 }
 */

/*
 Working real time text change detection
 struct SignInView: View {
     
     @State private var email: String = ""
     @State private var password: String = ""
     @State private var remember: Bool = false
     @State private var showSignUp: Bool = false
     @State private var showForgotPassword: Bool = false
     
     var body: some View {
         VStack(spacing: 20) {
             TopView(title: "Welcome Back", details: "Please login to your account.")
             
             // InfoTFView with real-time text display and character count
             InfoTFView(title: "Email", text: $email)
             
             VStack {
                 PasswordTFView(title: "Password", text: $password)
             }
             
             Spacer()
         }
         .animation(.spring(), value: email)
     }
 }
 
 struct InfoTFView: View {
     
     var title: String
     @Binding var text: String
     @FocusState private var isActive: Bool
     @State private var characterCount: Int = 0
     
     var body: some View {
         VStack(alignment: .leading, spacing: 5) {
             ZStack(alignment: .leading) {
                 TextField(isActive ? "Enter your email" : "", text: $text)
                     .padding(.horizontal, 10)
                     .frame(maxWidth: .infinity, maxHeight: 55)
                     .keyboardType(.emailAddress)
                     .focused($isActive)
                     .background(Color.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 16))
                     .onChange(of: text) { newValue in
                         characterCount = newValue.count // Update character count
                         print("Current text: \(newValue)") // Print the text in real time
                     }
                 
                 // Title that moves up when TextField is active or has text
                 Text(title)
                     .font(.system(size: 20))
                     .foregroundColor(.gray)
                     .padding(.horizontal, 10)
                     .offset(y: (isActive || !text.isEmpty) ? -40 : 0)
                     .scaleEffect((isActive || !text.isEmpty) ? 0.8 : 1.0, anchor: .leading)
                     .animation(.spring(), value: isActive || !text.isEmpty)
                     .onTapGesture {
                         isActive = true
                     }
             }
             .padding(.horizontal, 10)
             
             // Display character count
             Text("Character count: \(characterCount)")
                 .font(.caption)
                 .foregroundColor(.gray)
                 .padding(.leading, 10)
         }
     }
 }
 */
