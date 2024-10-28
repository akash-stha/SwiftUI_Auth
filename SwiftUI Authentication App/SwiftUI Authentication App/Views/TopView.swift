//
//  TopView.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-10-27.
//

import SwiftUI

struct TopView: View {
    
    var title: String
    var details: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.title.bold())
            Text(details)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        .padding(.top, 50)
    }
}

#Preview {
    TopView(title: "Welcome Back", details: "Please sign in to your account")
}
