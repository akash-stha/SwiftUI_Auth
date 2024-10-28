//
//  SwiftUI_Authentication_AppApp.swift
//  SwiftUI Authentication App
//
//  Created by Akash Shrestha on 2024-10-27.
//

import SwiftUI

@main
struct SwiftUI_Authentication_App: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            SignInView(email: .constant(""), password: .constant(""), remember: .constant(true), showSignUp: .constant(true))
                .preferredColorScheme(.dark)
        }
    }
}
