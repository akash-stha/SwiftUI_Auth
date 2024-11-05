//
//  PasswordValidationView.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-11-04.
//

import SwiftUI

struct PasswordValidationView: View {
    
    @State var text = ""
    @FocusState var isActive: Bool
    @State var checkMinChars = false
    @State var showPassword = false
    
    var progressColor: Color {
        if text.count >= 8 {
            return .green
        }
        return .gray
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PasswordValidationView()
}
