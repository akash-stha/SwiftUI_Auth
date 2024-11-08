//
//  InfoTF.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-10-27.
//

import SwiftUI

// MARK: First Deisgn Code
struct InfoTFView: View {
    
    var title: String
    @Binding var text: String
    @FocusState private var isActive: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ZStack(alignment: .leading) {
                TextField(isActive ? "Enter your email" : "", text: $text)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .focused($isActive)
                    .background(Color.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 16))
                    .onChange(of: text) { oldValue, newValue in
                        
                    }
                
                // Title that moves up when TextField is active or has text
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
}

#Preview {
    InfoTFView(title: "Email", text: .constant(""))
}

// MARK: Second Design Code
//struct InfoTFView: View {
//
//    var title: String
//    @Binding var text: String
//    @FocusState var isActive
//
//    var body: some View {
//        ZStack(alignment: .leading) {
//            TextField("", text: $text)
//                .padding()
//                .frame(maxWidth: .infinity, maxHeight: 55)
//                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
//                .focused($isActive)
//            Text(title)
//                .padding()
//                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
//                .scaleEffect((isActive || !text.isEmpty) ? 0.8 : 1.0, anchor: .leading)
//                .animation(.spring, value: isActive)
//                .onTapGesture {
//                    isActive = true
//                }
//        }
//    }
//}
