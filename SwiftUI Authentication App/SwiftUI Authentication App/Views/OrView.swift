//
//  OrView.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-11-04.
//

import SwiftUI

struct OrView: View {
    var body: some View {
        HStack(alignment: .center) {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.3))
            
            Text("or")
                .padding(.horizontal, 8) // Add some spacing around "or" for better visual balance
                .padding(.vertical, -12)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.3))
        }
        .padding(.top, -10)
        .padding(.horizontal, 10)
    }
    
}

#Preview {
    OrView()
}
