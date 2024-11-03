//
//  RememberMeView.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-11-03.
//

import SwiftUI

struct RememberMeView: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Button {
                configuration.isOn.toggle()
            } label: {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .contentTransition(.symbolEffect)
            }
            .tint(.primary)
            Text("Remember me")
        }
    }
}

