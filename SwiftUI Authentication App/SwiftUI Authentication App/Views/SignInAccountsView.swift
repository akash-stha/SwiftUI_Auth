//
//  SignInAccountsView.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-11-04.
//

import SwiftUI

struct SignInAccountsView: View {
    
    var image: ImageResource
    var action: () -> Void
    
    var body: some View {
        Button {
            
        } label: {
            image.imageIcon.renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .foregroundColor(.primary)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.5)
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white.opacity(0.7))
                    
                }
                .contentTransition(.symbolEffect)
        }

    }
    
}

#Preview {
    SignInAccountsView(image: .apple, action: {})
}

enum ImageResource: String {
    case apple = "apple"
    case google = "google"
    case email = "email"
    
    var imageIcon: Image {
        Image(self.rawValue)
    }
}
