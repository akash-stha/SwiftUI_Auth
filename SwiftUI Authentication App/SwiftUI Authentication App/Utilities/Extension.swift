//
//  Extension.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-11-05.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
