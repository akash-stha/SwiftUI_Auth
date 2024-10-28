//
//  PasswordTFView.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-10-27.
//

import SwiftUI

struct PasswordTFView: View {
    
    var title: String
    @Binding var text: String
    @FocusState var isActive: Bool
    @State var showPassword: Bool = false
    
    var body: some View {
        Text("Hello World!!!")
    }
}

#Preview {
    PasswordTFView(title: "Test", text: .constant(""))
}
