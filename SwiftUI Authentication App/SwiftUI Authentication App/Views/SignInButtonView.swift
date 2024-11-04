//
//  SignInButtonView.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-11-04.
//

import SwiftUI

struct SignInButtonView: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .foregroundStyle(.black)
                .font(.title2.bold())
                .frame(maxWidth: .infinity, maxHeight: 55)
                .background(.white, in: RoundedRectangle(cornerRadius: 16))
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    SignInButtonView(title: "Hello Akash", action: {})
}
